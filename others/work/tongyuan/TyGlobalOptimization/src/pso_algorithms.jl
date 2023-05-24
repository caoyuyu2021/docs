# 粒子群算法的不同调用方式

# function particleswarm(func, nvars, lb, ub, constraint_ueq=()::Tuple, options=pso_options_default::pso_options)                      
#     py"""
#     from optimization_algorithms import *
#     """
#     py"particleswarm"(func, nvars, lb, ub, size_pop=options.size_pop, max_iter=options.max_iter, w=options.w, c1=options.c1, c2=options.c2, constraint_ueq=constraint_ueq)
# end


# function particleswarm(problem::pso_problem)
#     py"""
#     from optimization_algorithms import *
#     """
#     py"particleswarm"(problem.func, problem.nvars, problem.lb, problem.ub, size_pop=problem.options.size_pop, max_iter=problem.options.max_iter, w=problem.options.w, c1=problem.options.c1, c2=problem.options.c2, constraint_ueq=problem.constraint_ueq)
# end

using Metaheuristics
using TyGlobalOptimization

# 1.x, fval, output = particleswarm(func, lb, ub)
function particleswarm(func, lb, ub)
    # 边界约束
    bounds = [lb ub]'

    # 优化
    pso = PSO(N=100, C1=1.5, C2=1.5, ω=0.7)
    res = Metaheuristics.optimize(func, bounds, pso)        # 有optimize!()

    # 输出信息
    x = minimizer(res)
    fval = minimum(res)
    f_calls = res.f_calls
    iterations = res.iteration
    time_run = res.final_time - res.start_time
    termination_status = termination_status_message(res)    # 停止条件：ITERATION_LIMIT、TIME_LIMIT、EVALUATIONS_LIMIT、ACCURACY_LIMIT、OBJECTIVE_VARIANCE_LIMIT、OBJECTIVE_DIFFERENCE_LIMIT、OTHER_LIMIT、UNKNOWN_STOP_REASON

    return x, fval, pso_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)
end


# 2.x, fval, output = particleswarm(func, lb, ub, constraint_ueq, constraint_ueq)
function particleswarm(func, lb, ub, constraint_ueq, constraint_eq)
    # 边界约束
    bounds = [lb ub]'

    # 目标函数及约束
    n_ueq = length(constraint_ueq)
    n_eq = length(constraint_eq)

    function f(x)

        fx = func(x)

        gx = []                                 # inequality constraints, <= 0
        for i = 1:n_ueq
            push!(gx, constraint_ueq[i](x))
        end
        gx = convert(Array{Float64}, gx)


        hx = []                                 # equality constraints, == 0
        for i = 1:n_eq
            push!(hx, constraint_eq[i](x))
        end
        hx = convert(Array{Float64}, hx)

        return fx, gx, hx                       # order is important
    end

    # 优化
    pso = PSO(N=100, C1=1.5, C2=1.5, ω=0.7)
    res = Metaheuristics.optimize(f, bounds, pso)

    # 输出信息
    x = minimizer(res)
    fval = minimum(res)
    f_calls = res.f_calls
    iterations = res.iteration
    time_run = res.final_time - res.start_time
    termination_status = termination_status_message(res)    # 停止条件：ITERATION_LIMIT、TIME_LIMIT、EVALUATIONS_LIMIT、ACCURACY_LIMIT、OBJECTIVE_VARIANCE_LIMIT、OBJECTIVE_DIFFERENCE_LIMIT、OTHER_LIMIT、UNKNOWN_STOP_REASON

    return x, fval, pso_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)
end


# 3.x, fval, output = particleswarm(func, lb, ub, constraint_ueq, constraint_eq, options)
function particleswarm(func, lb, ub, constraint_ueq, constraint_eq, options)
    # 边界约束
    bounds = [lb ub]'

    # 目标函数及约束
    n_ueq = length(constraint_ueq)
    n_eq = length(constraint_eq)

    function f(x)

        fx = func(x)

        gx = []                                 # inequality constraints, <= 0
        for i = 1:n_ueq
            push!(gx, constraint_ueq[i](x))
        end
        gx = convert(Array{Float64}, gx)


        hx = []                                 # equality constraints, == 0
        for i = 1:n_eq
            push!(hx, constraint_eq[i](x))
        end
        hx = convert(Array{Float64}, hx)

        return fx, gx, hx                       # order is important
    end

    # options
    information = Information(f_optimum=options.f_optimum, x_optimum=options.x_optimum)          # 存储真正的最优值，以便尽早停止元启发式
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

    # 优化
    pso = PSO(N=options.N, C1=options.C1, C2=options.C2, ω=options.ω, information=information, options=opts)
    res = Metaheuristics.optimize(f, bounds, pso)

    # 绘制收敛图
    if (options.draw_picture)
        figure()
        n_fes, fxs = convergence(res)
        plot(n_fes ./ options.N, fxs)
        title("迭代曲线")
        xlabel("迭代次数")
        ylabel("函数值")
    end

    # 输出信息
    x = minimizer(res)
    fval = minimum(res)
    f_calls = res.f_calls
    iterations = res.iteration
    time_run = res.final_time - res.start_time
    termination_status = termination_status_message(res)

    return x, fval, pso_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)
end


# 4.x, fval, output = particleswarm(problem)
function particleswarm(problem)
    # 解析problem
    func = problem.obj
    lb = problem.lb
    ub = problem.ub
    constraint_ueq = problem.constraint_ueq
    constraint_eq = problem.constraint_eq
    options = problem.options

    # 边界约束
    bounds = [lb ub]'

    # 目标函数及约束
    n_ueq = length(constraint_ueq)
    n_eq = length(constraint_eq)

    function f(x)

        fx = func(x)

        gx = []                                 # inequality constraints, <= 0
        for i = 1:n_ueq
            push!(gx, constraint_ueq[i](x))
        end
        gx = convert(Array{Float64}, gx)

        hx = []                                 # equality constraints, == 0
        for i = 1:n_eq
            push!(hx, constraint_eq[i](x))
        end
        hx = convert(Array{Float64}, hx)

        return fx, gx, hx                       # order is important
    end

    # options
    information = Information(f_optimum=options.f_optimum, x_optimum=options.x_optimum)          # 存储真正的最优值，以便尽早停止元启发式
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

    # 优化
    pso = PSO(N=options.N, C1=options.C1, C2=options.C2, ω=options.ω, information=information, options=opts)
    res = Metaheuristics.optimize(f, bounds, pso)

    # 绘制收敛图
    if (options.draw_picture)
        figure()
        n_fes, fxs = convergence(res)
        plot(n_fes ./ options.N, fxs)
        title("迭代曲线")
        xlabel("迭代次数")
        ylabel("函数值")
    end

    # 输出信息
    x = minimizer(res)
    fval = minimum(res)
    f_calls = res.f_calls
    iterations = res.iteration
    time_run = res.final_time - res.start_time
    termination_status = termination_status_message(res)
    
    return x, fval, pso_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)
end