using Metaheuristics
using TyGlobalOptimization



# 1.x, fval, output = ga(func, lb, ub)
function ga(func, lb, ub)
    # 边界约束
    bounds = [lb ub]'

    # 优化
    opts = Options(store_convergence=true)
    ga = Metaheuristics.GA(; mutation=PolynomialMutation(; bounds),
        crossover=Metaheuristics.SBX(; bounds),
        environmental_selection=GenerationalReplacement(),
        options=opts
    )

    res = Metaheuristics.optimize(func, bounds, ga)


    # 输出信息
    x = minimizer(res)
    fval = minimum(res)
    f_calls = res.f_calls
    iterations = res.iteration
    time_run = res.final_time - res.start_time
    termination_status = termination_status_message(res)    # 停止条件：ITERATION_LIMIT、TIME_LIMIT、EVALUATIONS_LIMIT、ACCURACY_LIMIT、OBJECTIVE_VARIANCE_LIMIT、OBJECTIVE_DIFFERENCE_LIMIT、OTHER_LIMIT、UNKNOWN_STOP_REASON

    return x, fval, ga_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)
end



# 2.x, fval, output = ga(func, lb, ub, constraint_ueq, constraint_eq)
function ga(func, lb, ub, constraint_ueq, constraint_eq)
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
    opts = Options(store_convergence=true)
    ga = Metaheuristics.GA(; mutation=PolynomialMutation(; bounds),
        crossover=Metaheuristics.SBX(; bounds),
        environmental_selection=GenerationalReplacement(),
        options=opts
    )

    res = Metaheuristics.optimize(f, bounds, ga)


    # 输出信息
    x = minimizer(res)
    fval = minimum(res)
    f_calls = res.f_calls
    iterations = res.iteration
    time_run = res.final_time - res.start_time
    termination_status = termination_status_message(res)

    return x, fval, ga_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)
end



# 3.x, fval, output = ga(func, lb, ub, constraint_ueq, constraint_eq, options)
function ga(func, lb, ub, constraint_ueq, constraint_eq, options)
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


    ga = Metaheuristics.GA(; N=options.N,
        mutation=PolynomialMutation(; bounds),
        crossover=Metaheuristics.SBX(; bounds),
        environmental_selection=GenerationalReplacement(),
        options=opts,
        information=information
    )

    res = Metaheuristics.optimize(f, bounds, ga)

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
    return x, fval, ga_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)
end



# 序列规划
# 4.x, fval, output = ga(func, perm_size)
function ga(func, perm_size::Integer)
    # 优化
    opts = Options(store_convergence=true)
    ga = Metaheuristics.GA(; initializer=RandomPermutation(N=100),
        crossover=OrderCrossover(),
        mutation=SlightMutation(),
        options=opts
    )

    res = Metaheuristics.optimize(func, zeros(Int, 2, perm_size), ga)


    # 输出信息
    x = minimizer(res)
    fval = minimum(res)
    f_calls = res.f_calls
    iterations = res.iteration
    time_run = res.final_time - res.start_time
    termination_status = termination_status_message(res)
    return x, fval, ga_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)

end



# 5.x, fval, output = ga(func, perm_size, options)
function ga(func, perm_size::Integer, options::ga_options)
    # options
    information = Information(f_optimum=options.f_optimum, x_optimum=options.x_optimum)
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
    ga = Metaheuristics.GA(; initializer=RandomPermutation(N=100),
        crossover=OrderCrossover(),
        mutation=SlightMutation(),
        options=opts,
        information=information
    )

    res = Metaheuristics.optimize(func, zeros(Int, 2, perm_size), ga)

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
    return x, fval, ga_output(; iterations=iterations, f_calls=f_calls, time_run=time_run, termination_status=termination_status)

end





