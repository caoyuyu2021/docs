using JuMP
using HiGHS

mutable struct ConeOptions
    max_iter::Integer            #最大迭代步数
    time_limit::Float64          #算法最大运行时间
    disp::Bool                   #是否显示详细信息
    max_step_fraction::Float64   #最大内点步长
    tol_abs::Float64             #绝对残余公差
    tol_rel::Float64             #相对残余公差

    function ConeOptions(;
        max_iter::Integer=50,
        time_limit::Float64=Inf,
        disp::Bool=false,
        max_step_fraction::Float64=0.99,
        tol_abs::Float64=1e-8,
        tol_rel::Float64=1e-8,
    )
        this = new()
        this.max_iter = max_iter
        this.time_limit = time_limit
        this.disp = disp
        this.max_step_fraction = max_step_fraction
        this.tol_abs = tol_abs
        this.tol_rel = tol_rel

        return this
    end
end

mutable struct IntconOptions
    max_iter::Integer            #最大迭代步数
    time_limit::Float64          #算法最大运行时间
    disp::Bool                   #是否显示详细信息
    tol::Float64                 #公差
    solve_method::String         #直接线性求解器

    function IntconOptions(;
        max_iter::Integer=50000,
        time_limit::Float64=Inf,
        disp::Bool=false,
        tol::Float64=1e-8,
        solve_method="choose",
    )
        this = new()
        this.max_iter = max_iter
        this.time_limit = time_limit
        this.disp = disp
        this.tol = tol
        this.solve_method = solve_method

        return this
    end
end

mutable struct LsqOptions
    max_nfev::Union{Integer,Nothing}           #目标函数最大估值次数
    verbose::Integer                #是否显示详细信息
    ftol::Float64
    xtol::Float64
    gtol::Float64
    x_scale
    f_scale
    loss
    args
    solve_method::String         #
    sigma
    absolute_sigma::Bool
    check_finite::Bool
    jac
    max_iter::Union{Integer,Nothing}
    tol
    lsmr_tol

    function LsqOptions(;
        max_nfev::Union{Integer,Nothing}=None(),
        verbose::Integer=0,
        ftol::Float64=1e-8,
        xtol::Float64=1e-8,
        gtol::Float64=1e-8,
        x_scale=1.0,
        f_scale=1.0,
        loss="linear",
        args=(),
        solve_method::String="trf",
        sigma=None(),
        absolute_sigma::Bool=false,
        check_finite::Bool=true,
        jac=None(),
        max_iter::Union{Integer,Nothing}=None(),
        tol=1e-10,
        lsmr_tol=None(),
    )
        this = new()
        this.max_nfev = max_nfev
        this.verbose = verbose
        this.ftol = ftol
        this.xtol = xtol
        this.gtol = gtol
        this.x_scale = x_scale
        this.f_scale = f_scale
        this.loss = loss
        this.args = args
        this.solve_method = solve_method
        this.sigma = sigma
        this.absolute_sigma = absolute_sigma
        this.check_finite = check_finite
        this.jac = jac
        this.max_iter = max_iter
        this.tol = tol
        this.lsmr_tol = lsmr_tol

        return this
    end
end

mutable struct OptimizeResult
    name::String
    H::Union{Matrix,Vector}
    f::Vector
    A::Union{Matrix,Vector}
    b::Vector
    Aeq::Union{Matrix,Vector}
    beq::Vector
    lb::Vector
    ub::Vector
    status::Int64
    success::Bool
    x::Union{Vector,Float64,Matrix}
    fun::Union{Vector,Float64}
    method::String
    niter::Int64
    nfev::Int64
    options
    model
    objfun
    allvecs

    function OptimizeResult(;
        name::String="linprog",
        H::Union{Matrix,Vector}=[],
        f::Vector=[],
        A::Union{Matrix,Vector}=[],
        b::Vector=[],
        Aeq::Union{Matrix,Vector}=[],
        beq::Vector=[],
        lb::Vector=[],
        ub::Vector=[],
        status::Int64=0,
        success::Bool=true,
        x::Union{Vector,Float64,Matrix}=[],
        fun::Union{Vector,Float64}=0.0,
        method::String="highs",
        niter::Int64=0,
        nfev::Int64=0,
        options=nothing,
        model=nothing,
        objfun=nothing,
        allvecs=[],
    )
        this = new()
        this.name = name
        this.H = H
        this.f = f
        this.A = A
        this.b = b
        this.Aeq = Aeq
        this.beq = beq
        this.lb = lb
        this.ub = ub
        this.status = status
        this.success = success
        this.x = x
        this.fun = fun
        this.method = method
        this.niter = niter
        this.nfev = nfev
        this.options = options
        this.model = model
        this.objfun = objfun
        this.allvecs = allvecs
        return this
    end
end

using Surrogates:
    SamplingAlgorithm,
    RadialFunction,
    linearRadial,
    cubicRadial,
    multiquadricRadial,
    thinplateRadial,
    sample,
    GridSample,
    UniformSample,
    SobolSample,
    LatinHypercubeSample,
    LowDiscrepancySample,
    RandomSample,
    KroneckerSample,
    GoldenSample,
    SectionSample

#代理优化优化选项
mutable struct surr_options
    num_samples #采样点数
    num_new_samples  #新增采样点数
    sample_algorithm::SamplingAlgorithm
    new_sample_algorithm::SamplingAlgorithm #新增点采样方法
    scale_factor #起始尺度
    sparse::Bool #使稀疏化
    maxiter  #迭代次数
    rad::RadialFunction #径向基函数

    function surr_options(;
        num_samples=10,
        num_new_samples=100,
        sample_algorithm::SamplingAlgorithm=SobolSample(),
        new_sample_algorithm::SamplingAlgorithm=UniformSample(),
        scale_factor=0.5,
        sparse::Bool=false,
        maxiter=100,
        rad::RadialFunction=linearRadial(),
    )
        this = new()
        this.num_samples = num_samples
        this.num_new_samples = num_new_samples
        this.sample_algorithm = sample_algorithm
        this.new_sample_algorithm = new_sample_algorithm
        this.scale_factor = scale_factor
        this.sparse = sparse
        this.maxiter = maxiter
        this.rad = rad
        return this
    end
end

mutable struct tr_options  #信赖域内点算法参数选项类
    algorithm::String           #优化算法名称
    bounds                      #优化变量边界
    jac                         #目标函数的雅克比矩阵
    hess                        #目标函数的海森矩阵
    hessp                       #海森矩阵乘以任意向量p
    tol                         #优化终止容差
    callback                    #回调函数
    maxiter                     #最大迭代次数
    disp::Bool                        #若为True，则输出收敛信息
    xtol                        #由拉格朗日梯度范数决定的优化终止容差
    gtol                        #自变量变化决定的优化终止容差
    barrier_tol                 #算法终止的屏障参数阈值
    sparse_jacobian             #如何表示约束的雅可比矩阵的参数
    initial_tr_radius           #初始信赖域半径
    initial_constr_penalty      #初始约束惩罚参数
    initial_barrier_parameter   #初始屏障参数
    initial_barrier_tolerance   #屏障子问题的初始容差
    factorization_method        #约束雅克比矩阵的分解方法
    finite_diff_rel_step        #有限差分近似的相对步长
    verbose                     #算法输出信息详细程度
    function tr_options(;
        algorithm::String="trust-constr",
        bounds=None(),
        jac=None(),
        hess=None(),
        hessp=None(),
        tol=None(),
        callback=None(),
        maxiter=1000,
        disp::Bool=false,
        xtol=1e-8,
        gtol=1e-8,
        barrier_tol=1e-8,
        sparse_jacobian=None(),
        initial_tr_radius=1.0,
        initial_constr_penalty=1.0,
        initial_barrier_parameter=0.1,
        initial_barrier_tolerance=0.1,
        factorization_method=None(),
        finite_diff_rel_step=None(),
        verbose=0,
    )
        this = new()
        this.algorithm = algorithm
        this.bounds = bounds
        this.jac = jac
        this.hess = hess
        this.hessp = hessp
        this.tol = tol
        this.callback = callback
        this.maxiter = maxiter
        this.disp = disp
        this.xtol = xtol
        this.gtol = gtol
        this.barrier_tol = barrier_tol
        this.sparse_jacobian = sparse_jacobian
        this.initial_tr_radius = initial_tr_radius
        this.initial_constr_penalty = initial_constr_penalty
        this.initial_barrier_parameter = initial_barrier_parameter
        this.initial_barrier_tolerance = initial_barrier_tolerance
        this.factorization_method = factorization_method
        this.finite_diff_rel_step = finite_diff_rel_step
        this.verbose = verbose
        return this
    end
end

mutable struct COBYLA_options  #线性近似约束优化算法参数选项类
    algorithm::String           #优化算法名称
    tol                         #优化终止容差
    callback                    #回调函数
    maxiter                     #最大迭代次数
    disp                        #若为True，则输出收敛信息
    rhobeg                      #优化变量合理的初始变化
    catol                       #约束冲突的公差（绝对值）
    function COBYLA_options(;
        algorithm::String="COBYLA",
        tol=None(),
        callback=None(),
        maxiter=1000,
        disp=false,
        rhobeg=1.0,
        catol=0.0002,
    )
        this = new()
        this.algorithm = algorithm
        this.tol = tol
        this.callback = callback
        this.maxiter = maxiter
        this.disp = disp
        this.rhobeg = rhobeg
        this.catol = catol
        return this
    end
end

mutable struct SLSQP_options    #序列最小二乘规划优化算法参数选项类
    algorithm::String           #优化算法名称
    bounds                      #优化变量边界
    jac                         #目标函数的雅克比矩阵
    tol                         #优化终止容差
    callback                    #回调函数
    maxiter                     #最大迭代次数
    disp                        #若为True，则输出收敛信息
    ftol                        #精度目标
    eps                         #雅克比矩阵数值逼近的步长
    finite_diff_rel_step        #用于雅克比数值近似的步长
    iprint                      #控制输出频率
    function SLSQP_options(;
        algorithm::String="SLSQP",
        bounds=None(),
        jac=None(),
        tol=None(),
        callback=None(),
        maxiter=100,
        disp=false,
        ftol=1e-6,
        eps=1.4901161193847656e-08,
        finite_diff_rel_step=None(),
        iprint=1,
    )
        this = new()
        this.algorithm = algorithm
        this.bounds = bounds
        this.jac = jac
        this.tol = tol
        this.callback = callback
        this.maxiter = maxiter
        this.disp = disp
        this.ftol = ftol
        this.eps = eps
        this.finite_diff_rel_step = finite_diff_rel_step
        this.iprint = iprint

        return this
    end
end

mutable struct NeldMead_options #NeldMead单纯性优化算法参数选项类
    algorithm::String           #优化算法名称
    args                        #优化目标函数的参数列表
    bounds                      #优化变量边界
    tol                         #优化终止容差
    callback                    #回调函数
    maxiter                     #最大迭代次数
    maxfev                      #目标函数最大评估次数
    disp                        #若为True，则输出收敛信息
    return_all                  #返回每次迭代的解
    initial_simplex             #初始单纯形
    xatol                       #精度目标
    fatol                       #精度目标
    adaptive                    #是否随着问题维度调整参数  
end

NeldMead_options_default = NeldMead_options(
    "Nelder-Mead",
    (),
    None(),
    None(),
    None(),
    None(),
    None(),
    false,
    false,
    None(),
    1e-5,
    1e-5,
    false
)

mutable struct Powell_options   #Powell直接搜索算法参数选项类
    algorithm::String           #优化算法名称
    args                        #优化目标函数的参数列表
    bounds                      #优化变量边界
    tol                         #优化终止容差
    callback                    #回调函数
    maxiter                     #最大迭代次数
    maxfev                      #目标函数最大评估次数
    disp                        #若为True，则输出收敛信息
    return_all                  #返回每次迭代的解
    direc                       #方向向量的初始设置
    xtol                        #精度目标
    ftol                        #精度目标
end

mutable struct LBFGSB_options   #有限内存拟牛顿算法参数选项类
    algorithm::String           #优化算法名称
    args                        #优化目标函数的参数列表
    jac                         #目标函数的雅克比矩阵
    bounds                      #优化变量边界
    tol                         #优化终止容差
    callback                    #回调函数
    maxiter                     #最大迭代次数
    maxcor                      #用于定义有限内存矩阵的可变度量校正的最大数量
    maxfun                      #目标函数最大评估次数
    disp                        #若为True，则输出收敛信息
    eps                         #采用前向差分对雅克比矩阵进行数值近似的绝对步长（若jac没提供）
    gtol                        #精度目标
    ftol                        #精度目标
    iprint                      #控制输出的频率
    maxls                       #每次迭代最大直线搜索步数
    finite_diff_rel_step        #用于雅克比数值近似的步长(若jac in ['2-point','3-point','cs'])
end

mutable struct trust_krylov_options   #信赖域算法参数选项类
    algorithm::String                 #优化算法名称
    args                        #优化目标函数的参数列表
    jac                               #目标函数的雅克比矩阵
    hess                              #目标函数的海森矩阵
    hessp                             #海森矩阵乘以任意向量p
    tol                               #优化终止容差
    callback                          #回调函数
    maxiter                           #最大迭代次数
    initial_trust_radius              #初始信赖域半径
    max_trust_radius                  #最大信赖域半径
    eta                               #信赖区相关接受强度
    gtol                              #精度目标
    inexact                           #解决子问题的准确性。如果为真，则需要较少的非线性迭代，但更多的向量积
    disp                              #若为True，则输出收敛信息
    return_all                        #返回每次迭代的解
end

mutable struct optimproblem
    Description::String     #优化问题描述
    objective               #优化目标函数
    x0                      #初始猜测值
    args                    #优化目标函数参数
    constraints             #优化约束
    options                 #算法参数选项
end

mutable struct eqnproblem
    Description::String     #方程问题描述
    equations               #待求解方程
    x0                      #初始猜测值
end

optimproblem_default = optimproblem("求优化目标函数的最小值", None(), [], (), (), None())

eqnproblem_default = eqnproblem("求指定方程的根", None(), ())

Powell_options_default = Powell_options(
    "Powell", (), None(), None(), None(), None(), None(), false, false, None(), 1e-5, 1e-5
)

LBFGSB_options_default = LBFGSB_options(
    "L-BFGS-B",
    (),
    None(),
    None(),
    None(),
    None(),
    15000,
    10,
    15000,
    None(),
    1e-8,
    1e-05,
    2.220446049250313e-09,
    -1,
    20,
    None()
)

trust_krylov_options_default = trust_krylov_options(
    "trust-krylov",
    (),
    None(),
    None(),
    None(),
    None(),
    None(),
    None(),
    1.0,
    1000.0,
    0.15,
    1e-5,
    true,
    false,
    false
)



function optimoptions(SolverName::String; kwargs...)  #变量类型,键值对Pair
    kwargs = Dict(kwargs)
    key = keys(kwargs)

    if SolverName == "surrogateopt"
        options = surr_options()

    elseif SolverName == "fmincon"
        if Base.get(kwargs,:algorithm,"nothing")=="trust-constr" 
            options = tr_options()

        elseif Base.get(kwargs,:algorithm,"nothing")=="COBYLA" 
            options = COBYLA_options()

        elseif Base.get(kwargs,:algorithm,"nothing")=="SLSQP" 
            options = SLSQP_options()
        else
            options = tr_options()
        end

    elseif SolverName == "fminsearch"
        options = NeldMead_options_default

    elseif SolverName == "fminunc"
        if Base.get(kwargs, :algorithm, "nothing") == "L-BFGS-B"
            options = LBFGSB_options_default
        
        elseif Base.get(kwargs, :algorithm, "nothing") == "Powell"
            options = Powell_options_default
        
        elseif Base.get(kwargs, :algorithm, "nothing") == "trust-krylov"
            options = trust_krylov_options_default
        else
            options = LBFGSB_options_default
        end
      

    elseif SolverName == "linprog"
        
        if Base.get(kwargs, :algorithm, "nothing") == "highs-ds"
            options = highs_ds_options_default
        
        elseif Base.get(kwargs, :algorithm, "nothing") == "highs-ipm"
            options = highs_ipm_options_default
        
        elseif Base.get(kwargs, :algorithm, "nothing") == "highs"
            options = highs_options_default
        else
            options = highs_options_default
        end
        

    elseif SolverName == "intlinprog"
        options = IntconOptions()

    elseif SolverName == "coneprog"
        options = ConeOptions()

    elseif SolverName == "quadprog"
        options = IntconOptions()

    elseif SolverName in ["lsqcurvefit", "lsqlin", "lsqnonlin", "lsqnonneg"]
        options = LsqOptions()

    else
        error("求解器名称输入不正确")
    end

    for i in key
        setproperty!(options, i, kwargs[i])
    end

    return options
end

function resetoptions(options, optionname::Symbol)
    if isa(options, surr_options)
        default_options = surr_options()
    
    elseif isa(options, tr_options)
        default_options = tr_options()
    
    elseif isa(options, COBYLA_options)
        default_options = COBYLA_options()
    
    elseif isa(options, SLSQP_options)
        default_options = SLSQP_options()
    
    elseif isa(options, NeldMead_options)
        default_options = NeldMead_options_default
    
    elseif isa(options, LBFGSB_options)
        default_options = LBFGSB_options_default
    
    elseif isa(options, Powell_options)
        default_options = Powell_options_default
    
    elseif isa(options, trust_krylov_options)
        default_options = trust_krylov_options_default
    
    elseif isa(options, highs_ds_options)
        default_options = highs_ds_options_default
    
    elseif isa(options, highs_ipm_options)
        default_options = highs_ipm_options_default
    
    elseif isa(options, highs_options)
        default_options = highs_options_default
    
    elseif isa(options, IntconOptions)
        default_options = IntconOptions()
    
    elseif isa(options, ConeOptions)
        default_options = ConeOptions()
    
    elseif isa(options, LsqOptions)
        default_options = LsqOptions()
    
    else
        error("options参数不正确")
    end

    #重置一个选项
    setproperty!(options, optionname, getproperty(default_options, optionname))

    return options
end
#multioptions,元组
function resetoptions(options, multioptions::Tuple)
    
    if isa(options, surr_options)
        default_options = surr_options()
    
    elseif isa(options, tr_options)
        default_options = tr_options()
    
    elseif isa(options, COBYLA_options)
        default_options = COBYLA_options()
    
    elseif isa(options, SLSQP_options)
        default_options = SLSQP_options()
    
    elseif isa(options, NeldMead_options)
        default_options = NeldMead_options_default
    
    elseif isa(options, LBFGSB_options)
        default_options = LBFGSB_options_default
    
    elseif isa(options, Powell_options)
        default_options = Powell_options_default
    
    elseif isa(options, trust_krylov_options)
        default_options = trust_krylov_options_default
    
    elseif isa(options, highs_ds_options)
        default_options = highs_ds_options_default
    
    elseif isa(options, highs_ipm_options)
        default_options = highs_ipm_options_default
    
    elseif isa(options, highs_options)
        default_options = highs_options_default
    
    elseif isa(options, IntconOption)
        default_options = IntconOptions()
    
    elseif isa(options, ConeOptions)
        default_options = ConeOptions()
    
    elseif isa(options, LsqOptions)
        default_options = LsqOptions()
    
    else
        error("options参数不正确")
    end

    #重置多个选项
    for i in multioptions
        setproperty!(options, i, getproperty(default_options, i))
    end
    return options
end

function showres(OptimizeResult)
    if OptimizeResult.name == "linprog"
        model = direct_model(HiGHS.Optimizer())
        if OptimizeResult.lb == [] && OptimizeResult.ub == []
            @variable(model, x[i=1:length(OptimizeResult.f)])
        else
            @variable(
                model,
                OptimizeResult.lb[i] <=
                    x[i=1:length(OptimizeResult.f)] <=
                    OptimizeResult.ub[i]
            )
        end

        @objective(model, Min, (OptimizeResult.f)'x)

        if !(OptimizeResult.A == [])
            @constraint(model, con_ineq, OptimizeResult.A * x .<= OptimizeResult.b)
        end

        if !(OptimizeResult.Aeq == [])
            @constraint(model, con_eq, OptimizeResult.Aeq * x .== OptimizeResult.beq)
        end

        set_silent(model)
        println("")
        println("优化问题描述：")
        print(model)
        println("")

        println("优化算法名称：", OptimizeResult.method)
        println("优化是否成功：", OptimizeResult.success)
        println("优化问题的解: x = ", OptimizeResult.x)
        println("优化目标函数值：f(x)= ", OptimizeResult.fun)

        # println("优化终止状态： ", OptimizeResult.status)
        # println("总迭代次数： ", OptimizeResult.niter)

        # if !(OptimizeResult.options == nothing)
        #     println("")
        #     println("优化算法主要参数设置如下：")
        # end

    elseif OptimizeResult.name == "intlinprog"
        set_silent(OptimizeResult.model)
        println("")
        println("优化问题描述：")
        print(OptimizeResult.model)
        println("")

        println("优化是否成功： ", OptimizeResult.success)
        println("优化问题的解: x = ", OptimizeResult.x)
        println("优化目标函数值：f(x)= ", OptimizeResult.fun)
        println("优化算法名称： ", OptimizeResult.method)

        if !(OptimizeResult.options == nothing)
            println("")
            println("优化算法主要参数设置如下：")
        end

    elseif OptimizeResult.name == "quadprog"
        set_silent(OptimizeResult.model)
        println("")
        println("优化问题描述：")
        print(OptimizeResult.model)
        println("")

        println("优化是否成功： ", OptimizeResult.success)
        println("优化问题的解: x = ", OptimizeResult.x)
        println("优化目标函数值：f(x)= ", OptimizeResult.fun)
        println("优化算法名称： ", OptimizeResult.method)

        if !(OptimizeResult.options == nothing)
            println("")
        end
    end
end

mutable struct optimset
    solvername::String          #求解器名称   
    algorithm::String           #算法名称
    bounds                      #优化变量边界
    args::Tuple                 #优化目标函数的参数列表
    tol::Union{Float64,Nothing} #优化终止容差
    maxiter::Integer            #最大迭代次数
    disp                        #0:不输出信息，1：仅输出非收敛信息，2：输出收敛及非收敛信息，3：输出迭代结果
    xatol                       #精度目标
    xtol                        #绝对终止容差
    rtol                        #相对终止容差
    fprime                      #目标标量函数的导数
    fprime2                     #目标标量函数的2阶导数
    function optimset(;
        solvername::String="",
        algorithm::String="brentq",
        bounds=None(),
        args::Tuple=(),
        tol::Union{Float64,Nothing}=None(),
        maxiter::Integer=500,
        disp=0,
        xatol=1e-6,
        xtol=None(),
        rtol=None(),
        fprime=None(),
        fprime2=None(),
    )
        this = new()
        this.solvername = solvername
        this.algorithm = algorithm
        this.bounds = bounds
        this.args = args
        this.tol = tol
        this.maxiter = maxiter
        this.disp = disp
        this.xatol = xatol
        this.xtol = xtol
        this.rtol = rtol
        this.fprime = fprime
        this.fprime2 = fprime2
        return this
    end
end


