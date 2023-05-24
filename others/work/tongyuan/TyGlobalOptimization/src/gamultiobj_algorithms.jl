#多目标遗传算法的不同调用方式
using Metaheuristics
using TyGlobalOptimization

# 打包函数
function packfcn(func, constraint_ueq, constraint_eq)
    n_ueq = length(constraint_ueq)
    n_eq = length(constraint_eq)

    function f(x)
        # 目标函数
        fx = func(x)

        # 不等式约束, <= 0
        if (n_ueq == 0)
            gx = [0.0]
        elseif (n_ueq == 1)
            gx = [constraint_ueq[1](x)]
        else
            gx = []
            for i = 1:n_ueq
                push!(gx, constraint_ueq[i](x))
            end
            gx = convert(Array{Float64}, gx)
        end

        # 等式约束, == 0
        if (n_eq == 0)
            hx = [0.0]
        elseif (n_eq == 1)
            hx = [constraint_eq[1](x)]
        else
            hx = []
            for i = 1:n_eq
                push!(hx, constraint_eq[i](x))
            end
            hx = convert(Array{Float64}, hx)
        end

        # 返回顺序固定
        return fx, gx, hx
    end

    return f
end

# 1.PS, PF, output = gamultiobj(objcon, nobj, lb, ub) / gamultiobj(objcon, nobj, lb, ub, options)
function gamultiobj(objcon, nobj, lb, ub, options=gamultiobj_options())
    # 边界约束
    bounds = [lb ub]'

    # options
    information = Information(f_optimum=options.f_optimum, x_optimum=options.x_optimum)    # 存储真实的最优值，以便尽早停止元启发式
    opts = Options(x_tol=options.x_tol,
        f_tol=options.f_tol,
        g_tol=options.g_tol,
        h_tol=options.h_tol,
        f_calls_limit=options.f_calls_limit,
        g_calls_limit=options.g_calls_limit,
        h_calls_limit=options.h_calls_limit,
        time_limit=options.time_limit,
        iterations=options.iterations,
        store_convergence=options.store_convergence,
        debug=options.debug,
        seed=options.seed,
        parallel_evaluation=options.parallel_evaluation)

    nsga = Metaheuristics.NSGA2(N=options.N, η_cr=options.η_cr, p_cr=options.p_cr, η_m=options.η_m, p_m=options.p_m, information=information, options=opts)

    # 优化
    res = Metaheuristics.optimize(objcon, bounds, nsga)

    # # res1 = results.best_sol
    non_dominated_res = Metaheuristics.get_non_dominated_solutions(res.population)
    # # res = (res1, res2)#a non_dominated_solution，Pareto Solutions，Pareto Front

    # 提取 Pareto Solutions，Pareto Front
    PS = zeros(length(lb), options.N)
    PF = zeros(length(non_dominated_res[1].f), options.N)
    for i = 1:options.N
        # push!(PS, res2[i].x)#PS,PF的类型为Vector{Vector{Float64}}无法索引
        # push!(PF, res2[i].f)
        PF[:, i] = non_dominated_res[i].f
        PS[:, i] = non_dominated_res[i].x

    end

    # 帕累托前沿图
    if (options.draw_picture)

        if (nobj == 2)                     # 目标函数个数
            figure()
            scatter(PF[1, :], PF[2, :])
            title("Pareto Front")
            xlabel("f1")
            ylabel("f2")
        elseif (nobj == 3)
            figure()
            scatter3(PF[1, :], PF[2, :], PF[3, :])
            title("Pareto Front")
            xlabel("f1")
            ylabel("f2")
            zlabel("f3")
        else
            println("仅能绘制三维及以下的帕累托前沿图！")
        end

    end


    # 输出信息
    f_calls = res.f_calls
    iterations = res.iteration
    time_run = res.final_time - res.start_time
    termination_status = termination_status_message(res)
    return PS, PF, gamultiobj_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)
end


# 2.PS, PF, output = gamultiobj(problem)
function gamultiobj(problem)
    # 解析problem
    objcon = problem.objcon
    nobj = problem.nobj
    lb = problem.lb
    ub = problem.ub
    options = problem.options

    gamultiobj(objcon, nobj, lb, ub, options)

end

