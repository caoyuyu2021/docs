#类型定义

# # 粒子群算法
# mutable struct pso_options
#     size_pop
#     max_iter
#     w
#     c1
#     c2
# end

# mutable struct pso_problem
#     func
#     nvars
#     lb
#     ub
#     options
#     constraint_ueq::Tuple
# end

# pso_options_default = pso_options(50, 200, 0.8, 0.5, 0.5)
# pso_problem_default = pso_problem(None(), None(), None(), None(), pso_options_default, ())




# mutable struct ga_options

#     #停止参数
#     abstol::Float64                 # 绝对误差(与最优解，提供最优解)
#     reltol::Float64                 # 相对误差（与上一解差值）
#     iterations::Integer             # 最大迭代次数
#     time_limit::Float64             # 优化运行的时间限制（以秒为单位），如果该值设置为NaN，则不设置限制
#     #显示参数
#     store_trace::Bool               # 在优化期间启用跟踪信息捕获
#     show_every::Integer             # 显示每ns个连续的跟踪消息
#     #设定
#     parallelization::Symbol         # 如果设置为:thread，表示允许population适应度评估并行化
#     rng                # 随机数生成器对象，用于控制进化优化过程中随机数据的生成
#     #算法内部参数
#     populationSize::Integer         # 人口规模
#     crossoverRate::Float64          # 下一代人口比例，不包括精英子女，由交叉函数产生
#     mutationRate::Float64           # 染色体发生突变的概率
#     epsilon::Real                   # 正整数表示当前一代中有多少个体能保证存活到下一代，浮点数表示总体的百分比（1采用正整数吧）
#     selection::Function           # 选择函数：ranklinear、uniformranking、roulette、rouletteinv、sus、susinv、truncation、tournament
#     crossover::Function            # 交叉函数：
#     # 【Binary】-SPX、TPX、SHFX、UX、BINX、EXPX、BSX；
#     # 【Real-valued】-DC、AX、WAX、IC、LC、HX、LX、MILX(整数规划只能使用这个)、SBX（genop不可用）
#     # 【Combinatorial】-PMX、OX1、CX、OX2、POS、SSX(暂不开放)
#     mutation::Function           # 突变函数
#     # 【Binary】-flip、bitinversion；
#     # 【Real-valued】-uniform、gaussian、BGA、PM、MIPM(整数规划只能使用这个)、PLM；
#     # 【Combinatorial】-inversion、insertion、swap2、scramble、shifting、replace(暂不开放)

#     # 暂未使用
#     #   successive_f_tol=15 #收敛测试成功后额外迭代次数
#     #   callback=nothing    #回调函数


#     function ga_options()
#         this = new()
#         this.abstol = Inf
#         this.reltol = Inf
#         this.iterations = 3000
#         this.store_trace = false
#         this.show_every = 1
#         this.time_limit = NaN           #单位待确定
#         this.parallelization = :serial
#         this.rng = Random.default_rng()

#         this.populationSize = 100
#         this.crossoverRate = 0.8
#         this.mutationRate = 0.1
#         this.epsilon = 0
#         this.selection = rouletteinv
#         this.crossover = AX
#         this.mutation = BGA([1, 2], 20) #方差
#         return this
#     end
# end

# mutable struct ga_problem
#     func::Function
#     lb::Vector
#     ub::Vector
#     options::ga_options
#     constraint_eq::Tuple
#     constraint_ueq::Tuple

#     function ga_problem()
#         this = new()
#         this.options = ga_options()
#         return this
#     end
# end
# ga_options_default = ga_options()
# ga_problem_default = ga_problem()


# #遗传算法
# mutable struct ga_options
#     size_pop
#     max_iter
#     prob_mut
#     precision                      #::union{Float64,Vector}#注意该改动，不通过使用if
# end

# mutable struct ga_problem
#     func
#     nvars
#     lb
#     ub
#     options
#     constraint_eq::Tuple
#     constraint_ueq::Tuple
# end

# ga_options_default = ga_options(50, 200, 0.001, 1e-7)
# ga_problem_default = ga_problem(None(), None(), None(), None(), ga_options_default, (), ())

# #模拟退火算法
# mutable struct sa_options
#     T0             #初始温度
#     alpha          #冷却因子
#     L              #每一温度下搜索次数
#     max_iter       #最大迭代次数
# end

# mutable struct sa_problem
#     func
#     x0
#     lb
#     ub
#     options
# end

# sa_options_default = sa_options(1, 0.99, 10, 100)
# sa_problem_default = sa_problem(None(), None(), None(), None(), sa_options_default)


mutable struct paretosearch_options
    max_archive       #最大存档
    max_iter          #最大迭代次数
    step_size         #步长,默认(ub-lb)/10,如何实现？在不同调用方式中再做处理
    lambda            #步长放大倍数       
    beta1             #步长缩小系数下限
    beta2             #步长缩小系数上限
    step_tolerance    #允许的最小步长
    cons_tolerance    #允许的最小误差
end

mutable struct paretosearch_problem
    objcon
    x0
    lb
    ub
    options
end

paretosearch_options_default = paretosearch_options(100, 1000, 0.1, 1.05, 0.5, 0.9, 1e-6, 1e-6)#步长, 默认(ub - lb) / 10
paretosearch_problem_default = paretosearch_problem(None(), None(), None(), None(), paretosearch_options_default)


mutable struct ps_options
    sigma        #步长
    alpha        #收缩因子
    epsilon      #允许的最小步长
end

mutable struct ps_problem
    func
    nvars
    x0
    lb
    ub
    options
end

ps_options_default = ps_options(1, 0.2, 1e-6)
ps_problem_default = ps_problem(None(), None(), None(), None(), None(), ps_options_default)

using Surrogates: SamplingAlgorithm, RadialFunction,
    linearRadial, cubicRadial, multiquadricRadial, thinplateRadial,
    sample, GridSample, UniformSample, SobolSample, LatinHypercubeSample,
    LowDiscrepancySample, RandomSample, KroneckerSample, GoldenSample, SectionSample


#代理优化优化选项
mutable struct surr_options
    num_samples #采样点数
    num_new_samples  #新增采样点数
    sample_algorithm::SamplingAlgorithm
    new_sample_algorithm::SamplingAlgorithm #新增点采样方法
    scale_factor #起始尺度
    sparse::Bool #使稀疏化
    maxiters  #迭代次数
    rad::RadialFunction #径向基函数

    function surr_options()
        this = new()
        this.num_samples = 10
        this.num_new_samples = 100
        this.sample_algorithm = SobolSample()
        this.new_sample_algorithm = UniformSample()
        this.scale_factor = 0.5
        this.sparse = false
        this.maxiters = 100
        this.rad = linearRadial()
        return this
    end
end

#代理优化问题描述,生成函数暂不开发
mutable struct surr_problem
    obj
    lb
    ub
    options::surr_options
    function surr_problem()
        this = new()
        this.options = surr_options()
        return this
    end
end

surr_options_default = surr_options()
surr_problem_default = surr_problem()


#如何根据不同求解器实现所有求解器的统一
#所有输出
#类似options吧

# mutable struct ga_output

#     iterations::Integer #迭代次数
#     f_calls::Integer    #函数评估次数
#     time_run::Float64   #运行时间
#     converged::Bool  #是否收敛


#     #每个求解器不同输出
#     function ga_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, converged=converged)
#         this = new()
#         this.iterations = iterations
#         this.f_calls = f_calls
#         this.time_run = time_run
#         this.converged = converged
#         return this
#     end
# end


# 遗传算法
# 选项
mutable struct ga_options
    x_tol::Real                     # 若给定真实解，对真实解的容差
    f_tol::Real                     # 若给定真实值，对真实值的容差
    g_tol::Real                     # 若给定不等式约束，对不等式约束的容差
    h_tol::Real                     # 若给定等式约束，对等式约束的容差
    f_calls_limit::Integer          # 目标函数最大评估次数，正整数
    g_calls_limit::Integer          # 不等式约束函数最大评估次数，正整数
    h_calls_limit::Integer          # 等式约束函数最大评估次数，正整数
    time_limit::Real                # 最大时间限制 
    iterations::Integer             # 最大迭代次数，正整数
    store_convergence::Bool         # 是否保存每次迭代状态
    debug::Bool                     # 是否报告每次迭代状态
    seed::UInt                      # 随机种子，非负整数
    parallel_evaluation::Bool       # 是否并行评估

    f_optimum::Real                 # 真实值
    x_optimum::Union{Vector,Real}   # 真实解

    N::Integer                      # 种群规模
    draw_picture::Bool              # 是否绘制收敛图
    # p_mutation                      #
    # p_crossover                     # 
    # initializer                     # 
    # selection                       #
    # crossover                       #
    # mutation                        #
    # environmental_selection         #

    function ga_options(; x_tol=1e-3, f_tol=1e-3, g_tol=1e-3, h_tol=1e-3,
        f_calls_limit=200000, g_calls_limit=200000, h_calls_limit=200000, time_limit=Inf,
        iterations=1000, store_convergence=true, debug=false, seed=rand(UInt),
        parallel_evaluation=false, f_optimum=NaN, x_optimum=zeros(0), N=100, draw_picture=false)
        this = new()
        this.x_tol = x_tol
        this.f_tol = f_tol
        this.g_tol = g_tol
        this.h_tol = h_tol
        this.f_calls_limit = f_calls_limit
        this.g_calls_limit = g_calls_limit
        this.h_calls_limit = h_calls_limit
        this.time_limit = time_limit
        this.iterations = iterations
        this.store_convergence = store_convergence
        this.debug = debug
        this.seed = seed
        this.parallel_evaluation = parallel_evaluation

        this.f_optimum = f_optimum
        this.x_optimum = x_optimum

        this.N = N
        this.draw_picture = draw_picture
        # this.p_mutation = p_mutation
        # this.p_crossover = p_crossover
        # this.initializer = initializer
        # this.selection = TournamentSelection()
        # this.crossover = UniformCrossover()
        # this.mutation = SlightMutation()
        # this.environmental_selection = GenerationalReplacement()

        return this
    end
end

# 输出
mutable struct ga_output
    iterations::Integer     # 迭代次数
    f_calls::Integer        # 函数评估次数
    time_run::Real          # 运行时间
    termination_status      # 停止状态

    function ga_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)
        this = new()
        this.iterations = iterations
        this.f_calls = f_calls
        this.time_run = time_run
        this.termination_status = termination_status

        return this
    end
end


# 粒子群算法
# 选项
mutable struct pso_options
    x_tol::Real                     # 若给定真实解，对真实解的容差
    f_tol::Real                     # 若给定真实值，对真实值的容差
    g_tol::Real                     # 若给定不等式约束，对不等式约束的容差
    h_tol::Real                     # 若给定等式约束，对等式约束的容差
    f_calls_limit::Integer          # 目标函数最大评估次数，正整数
    g_calls_limit::Integer          # 不等式约束函数最大评估次数，正整数
    h_calls_limit::Integer          # 等式约束函数最大评估次数，正整数
    time_limit::Real                # 最大时间限制 
    iterations::Integer             # 最大迭代次数
    store_convergence::Bool         # 是否保存每次迭代状态
    debug::Bool                     # 是否报告每次迭代状态
    seed::UInt                      # 随机种子，非负整数
    parallel_evaluation::Bool       # 是否并行评估

    f_optimum::Real                 # 真实值
    x_optimum::Union{Vector,Real}   # 真实解

    N::Integer                      # 种群规模
    C1::Real                        # 自我学习率
    C2::Real                        # 社会学习率
    ω::Real                         # 惯性权重

    draw_picture::Bool              # 是否绘制收敛图

    function pso_options(; x_tol=1e-3, f_tol=1e-3, g_tol=1e-3, h_tol=1e-3, f_calls_limit=200000, g_calls_limit=200000,
        h_calls_limit=200000, time_limit=Inf, iterations=1000, store_convergence=true, debug=false, seed=rand(UInt),
        parallel_evaluation=false, f_optimum=NaN, x_optimum=zeros(0), N=100, C1=2.0, C2=2.0, ω=0.8, draw_picture=false)
        this = new()
        this.x_tol = x_tol
        this.f_tol = f_tol
        this.g_tol = g_tol
        this.h_tol = h_tol
        this.f_calls_limit = f_calls_limit
        this.g_calls_limit = g_calls_limit
        this.h_calls_limit = h_calls_limit
        this.time_limit = time_limit
        this.iterations = iterations
        this.store_convergence = store_convergence
        this.debug = debug
        this.seed = seed
        this.parallel_evaluation = parallel_evaluation

        this.f_optimum = f_optimum
        this.x_optimum = x_optimum

        this.N = N
        this.C1 = C1
        this.C2 = C2
        this.ω = ω

        this.draw_picture = draw_picture

        return this
    end
end

# problem
mutable struct pso_problem
    obj::Function
    lb::Vector
    ub::Vector
    constraint_ueq::Tuple
    constraint_eq::Tuple
    options::pso_options

    function pso_problem()
        this = new()
        this.lb = []
        this.ub = []
        this.constraint_ueq = ()
        this.constraint_eq = ()
        this.options = pso_options()

        return this
    end
end

# 输出
mutable struct pso_output
    iterations::Integer         # 迭代次数，正整数
    f_calls::Integer            # 函数评估次数，正整数
    time_run::Real              # 运行时间
    termination_status          # 停止状态

    function pso_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)
        this = new()
        this.iterations = iterations
        this.f_calls = f_calls
        this.time_run = time_run
        this.termination_status = termination_status

        return this
    end
end


# 模拟退火算法
# 选项
mutable struct sa_options
    x_tol::Real                     # 若给定真实解，对真实解的容差
    f_tol::Real                     # 若给定真实值，对真实值的容差
    g_tol::Real                     # 若给定不等式约束，对不等式约束的容差
    h_tol::Real                     # 若给定等式约束，对等式约束的容差
    f_calls_limit::Integer          # 目标函数最大评估次数，正整数
    g_calls_limit::Integer          # 不等式约束函数最大评估次数，正整数
    h_calls_limit::Integer          # 等式约束函数最大评估次数，正整数
    time_limit::Real                # 最大时间限制 
    iterations::Integer             # 最大迭代次数
    store_convergence::Bool         # 是否保存每次迭代状态
    debug::Bool                     # 是否报告每次迭代状态
    seed::UInt                      # 随机种子，非负整数
    parallel_evaluation::Bool       # 是否并行评估

    f_optimum::Real                 # 真实值
    x_optimum::Union{Vector,Real}   # 真实解

    x_initial::Vector               # 初始解
    N::Integer                      # 每次迭代的测试点数量
    tol_fun::Real                   # Metropolis条件的容差值，以接受或拒绝测试点作为当前点

    draw_picture::Bool              # 是否绘制收敛图

    function sa_options(; x_tol=1e-3, f_tol=1e-3, g_tol=1e-3, h_tol=1e-3, f_calls_limit=200000, g_calls_limit=200000,
        h_calls_limit=200000, time_limit=Inf, iterations=1000, store_convergence=true, debug=false, seed=rand(UInt),
        parallel_evaluation=false, f_optimum=NaN, x_optimum=zeros(0), x_initial=zeros(0), N=500, tol_fun=1e-4,
        draw_picture=false)
        this = new()
        this.x_tol = x_tol
        this.f_tol = f_tol
        this.g_tol = g_tol
        this.h_tol = h_tol
        this.f_calls_limit = f_calls_limit
        this.g_calls_limit = g_calls_limit
        this.h_calls_limit = h_calls_limit
        this.time_limit = time_limit
        this.iterations = iterations
        this.store_convergence = store_convergence
        this.debug = debug
        this.seed = seed
        this.parallel_evaluation = parallel_evaluation

        this.f_optimum = f_optimum
        this.x_optimum = x_optimum

        this.x_initial = x_initial
        this.N = N
        this.tol_fun = tol_fun
        this.draw_picture = draw_picture

        return this
    end
end

# problem
mutable struct sa_problem
    obj::Function
    x0::Vector
    lb::Vector
    ub::Vector
    options::sa_options

    function sa_problem()
        this = new()
        this.x0 = zeros(0)
        this.lb = []
        this.ub = []
        this.options = sa_options()
        return this
    end
end

# 输出
mutable struct sa_output
    iterations::Integer         # 迭代次数，正整数
    f_calls::Integer            # 函数评估次数，正整数
    time_run::Real              # 运行时间
    termination_status          # 停止状态

    function sa_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)
        this = new()
        this.iterations = iterations
        this.f_calls = f_calls
        this.time_run = time_run
        this.termination_status = termination_status

        return this
    end
end


# 多起点算法
using NLopt: LN_BOBYQA, LN_NEWUOA_BOUND, LN_NELDERMEAD, LN_SBPLX, LN_COBYLA

mutable struct mul_options
    localmethod                             # 局部优化算法
    xtol_abs::Float64                       # 绝对容差，目前只支持Float64
    xtol_rel::Float64                       # 相对容差，目前只支持Float64
    maxeval::Integer                        # 最大评估次数，目前只支持Int
    maxtime::Float64                        # 最大时间限制，目前只支持Float64

    n::Integer                              # 初始点个数，目前只支持Int


    function mul_options(; localmethod="LN_BOBYQA", xtol_abs=1e-8, xtol_rel=1e-8, maxeval=0, maxtime=0.0,
        n=100)
        this = new()

        if (localmethod == "LN_BOBYQA")
            this.localmethod = LN_BOBYQA
        elseif (localmethod == "LN_NEWUOA_BOUND")
            this.localmethod = LN_NEWUOA_BOUND
        elseif (localmethod == "LN_NELDERMEAD")
            this.localmethod = LN_NELDERMEAD
        elseif (localmethod == "LN_SBPLX")
            this.localmethod = LN_SBPLX
        elseif (localmethod == "LN_COBYLA")
            this.localmethod = LN_COBYLA
        end
        this.xtol_abs = xtol_abs
        this.xtol_rel = xtol_rel
        this.maxeval = maxeval
        this.maxtime = maxtime

        this.n = n
        return this
    end
end


# 多目标遗传算法
# 选项
mutable struct gamultiobj_options
    x_tol::Real                     # 若给定真实解，对真实解的容差
    f_tol::Real                     # 若给定真实值，对真实值的容差
    g_tol::Real                     # 若给定不等式约束，对不等式约束的容差
    h_tol::Real                     # 若给定等式约束，对等式约束的容差
    f_calls_limit::Integer          # 目标函数最大评估次数，正整数
    g_calls_limit::Integer          # 不等式约束函数最大评估次数，正整数
    h_calls_limit::Integer          # 等式约束函数最大评估次数，正整数
    time_limit::Real                # 最大时间限制 
    iterations::Integer             # 最大迭代次数，正整数
    store_convergence::Bool         # 是否保存每次迭代状态
    debug::Bool                     # 是否报告每次迭代状态
    seed::UInt                      # 随机种子，非负整数
    parallel_evaluation::Bool       # 是否并行评估

    f_optimum::Real                 # 真实值
    x_optimum::Union{Vector,Real}   # 真实解

    N::Integer                      # 种群规模
    η_cr::Float64                   # 交叉算子，目前只支持Float64
    p_cr::Float64                   # 交叉概率，目前只支持Float64
    η_m::Float64                    # 突变算子，目前只支持Float64
    p_m::Float64                    # 突变概率，目前只支持Float64

    draw_picture::Bool              # 是否绘制帕累托前沿图

    function gamultiobj_options(; x_tol=1e-3, f_tol=1e-3, g_tol=1e-3, h_tol=1e-3,
        f_calls_limit=200000, g_calls_limit=200000, h_calls_limit=200000, time_limit=Inf,
        iterations=1000, store_convergence=true, debug=false, seed=rand(UInt),
        parallel_evaluation=false, f_optimum=NaN, x_optimum=zeros(0), N=100, η_cr=20, p_cr=0.9,
        η_m=20, p_m=0.2, draw_picture=false)
        this = new()
        this.x_tol = x_tol
        this.f_tol = f_tol
        this.g_tol = g_tol
        this.h_tol = h_tol
        this.f_calls_limit = f_calls_limit
        this.g_calls_limit = g_calls_limit
        this.h_calls_limit = h_calls_limit
        this.time_limit = time_limit
        this.iterations = iterations
        this.store_convergence = store_convergence
        this.debug = debug
        this.seed = seed
        this.parallel_evaluation = parallel_evaluation
        this.f_optimum = f_optimum
        this.x_optimum = x_optimum
        this.N = N
        this.η_cr = η_cr
        this.p_cr = p_cr
        this.η_m = η_m
        this.p_m = p_m
        this.draw_picture = draw_picture

        return this
    end
end

# problem
mutable struct gamultiobj_problem
    objcon::Function
    nobj::Integer
    lb::Vector
    ub::Vector
    options::gamultiobj_options

    function gamultiobj_problem()
        this = new()
        this.options = gamultiobj_options()
    
        return this
    end
end

# 输出
mutable struct gamultiobj_output
    iterations::Integer             # 迭代次数
    f_calls::Integer                # 函数评估次数
    time_run::Real                  # 运行时间
    termination_status              # 停止状态

    function gamultiobj_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)
        this = new()
        this.iterations = iterations
        this.f_calls = f_calls
        this.time_run = time_run
        this.termination_status = termination_status

        return this
    end
end