#模拟退火算法的不同调用方式
# function simulannealbnd(func, x0, lb, ub, options=sa_options_default::sa_options)
#     simulatedannealing(func, x0, lb, ub, T0=options.T0, alpha=options.alpha, L=options.L, max_iter=options.max_iter)
# end

# function simulannealbnd(problem=sa_options_default::sa_problem)
#     simulatedannealing(problem.func, problem.x0, problem.lb, problem.ub, T0=problem.options.T0, alpha=problem.options.alpha, L=problem.options.L, max_iter=problem.options.max_iter)
# end

using Metaheuristics


# 1.x, fval, output = simulannealbnd(func, x0, lb, ub) / simulannealbnd(func, x0, lb, ub, options)
function simulannealbnd(func, x0, lb, ub, options=sa_options())
    # 边界约束
    bounds = [lb ub]'

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
    sa = SA(x_initial=x0, N=options.N, tol_fun=options.tol_fun, information=information, options=opts)
    res = Metaheuristics.optimize(func, bounds, sa)

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

    return x, fval, sa_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)
end

# 2.x, fval, output = simulannealbnd(problem)
function simulannealbnd(problem)
    # 解析problem
    func = problem.obj
    x0 = problem.x0
    lb = problem.lb
    ub = problem.ub
    options = problem.options

    # 边界约束
    bounds = [lb ub]'

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
    sa = SA(x_initial=x0, N=options.N, tol_fun=options.tol_fun, information=information, options=opts)
    res = Metaheuristics.optimize(func, bounds, sa)

    # 绘制收敛图
    if (options.draw_picture)
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

    return x, fval, sa_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)
end
