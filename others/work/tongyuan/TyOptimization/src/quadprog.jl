#二次规划及锥规划算法函数

# using LinearAlgebra
using JuMP

function quadprog(H::Union{Matrix,Vector,Nothing}, f::Union{Matrix,Vector,Nothing})
    
    model = direct_model(HiGHS.Optimizer())
    @variable(model, x[i = 1:length(f)])
    @objective(model, Min, 0.5 * x' * H * x + f'x)

    set_silent(model)
    optimize!(model)
    res = JuMP.value.(x)
    obj = objective_value(model)

    if termination_status(model) == OPTIMAL || (termination_status(model) == TIME_LIMIT && has_values(model))
        success = true
    else
        success = false
    end

    a = OptimizeResult(name = "quadprog", H=H,f = f,  success = success, x = res, 
        fun = obj, method = "choose", model = model)

    return a

end


function quadprog(H::Union{Matrix,Vector,Nothing}, f::Union{Matrix,Vector,Nothing}, A::Union{Matrix,Vector,Nothing}, b::Union{Matrix,Vector,Nothing})

    model = direct_model(HiGHS.Optimizer())
    @variable(model, x[i = 1:length(f)])
    @objective(model, Min, 0.5 * x' * H * x + f'x)
    @constraint(model, con, A * x .<= b)

    set_silent(model)
    optimize!(model)
    res = JuMP.value.(x)
    obj = objective_value(model)

    if termination_status(model) == OPTIMAL || (termination_status(model) == TIME_LIMIT && has_values(model))
        success = true
    else
        success = false
    end

    a = OptimizeResult(name = "quadprog", H = H, f = f, success = success, x = res,A=A,b=b,
        fun = obj, method = "choose", model = model)

    return a

end

function quadprog(H::Union{Matrix,Vector,Nothing}, f::Union{Matrix,Vector,Nothing}, A::Union{Matrix,Vector,Nothing}, b::Union{Matrix,Vector,Nothing},
    Aeq::Union{Matrix,Vector,Nothing}, beq::Union{Matrix,Vector,Nothing})

    model = direct_model(HiGHS.Optimizer())
    @variable(model, x[i = 1:length(f)])
    @objective(model, Min, 0.5 * x' * H * x + f'x)

    if A == [] && !(Aeq == [])
        @constraint(model, con_eq, Aeq * x .== beq)

    elseif Aeq == [] && !(A == [])
        @constraint(model, con_ineq, A * x .<= b)

    elseif !(Aeq == []) && !(A == [])
        @constraint(model, con_ineq, A * x .<= b)
        @constraint(model, con_eq, Aeq * x .== beq)
    else
        @warn "参数设置错误，请检查"
    end

    set_silent(model)
    optimize!(model)
    res = JuMP.value.(x)
    obj = objective_value(model)

    if termination_status(model) == OPTIMAL || (termination_status(model) == TIME_LIMIT && has_values(model))
        success = true
    else
        success = false
    end

    a = OptimizeResult(name = "quadprog", H = H, f = f, success = success, x = res, A = A, b = b,Aeq=Aeq,beq=beq,
        fun = obj, method = "choose", model = model)

    return a




end

function quadprog(H::Union{Matrix,Nothing}, f::Union{Vector,Nothing}, A::Union{Matrix,Vector,Nothing}, b::Union{Vector,Nothing},
    Aeq::Union{Matrix,Vector,Nothing}, beq::Union{Vector,Nothing}, lb::Union{Vector,Nothing}, ub::Union{Vector,Nothing})

    model = direct_model(HiGHS.Optimizer())
    @variable(model, lb[i] <= x[i = 1:length(f)] <= ub[i])
    @objective(model, Min, 0.5 * x' * H * x + f'x)

    if A == [] && !(Aeq == [])
        @constraint(model, con_eq, Aeq * x .== beq)

    elseif Aeq == [] && !(A == [])
        @constraint(model, con_ineq, A * x .<= b)

    elseif !(Aeq == []) && !(A == [])
        @constraint(model, con_ineq, A * x .<= b)
        @constraint(model, con_eq, Aeq * x .== beq)

    elseif Aeq == [] && A == []
        nothing
    else
        @warn "参数设置错误，请检查"
    end


    set_silent(model)
    optimize!(model)
    res = JuMP.value.(x)
    obj = objective_value(model)

    if termination_status(model) == OPTIMAL || (termination_status(model) == TIME_LIMIT && has_values(model))
        success = true
    else
        success = false
    end

    a = OptimizeResult(name = "quadprog", H = H, f = f, success = success, x = res, A = A, b = b, Aeq = Aeq, beq = beq,lb=lb,ub=ub,
        fun = obj, method = "choose", model = model)

    return a

end

function quadprog(H::Union{Matrix,Nothing}, f::Union{Vector,Nothing}, A::Union{Matrix,Vector,Nothing}, b::Union{Vector,Nothing},
    Aeq::Union{Matrix,Vector,Nothing}, beq::Union{Vector,Nothing}, lb::Union{Vector,Nothing}, ub::Union{Vector,Nothing}, options)

    model = Model(optimizer_with_attributes(HiGHS.Optimizer, "simplex_iteration_limit" => options.max_iter, "ipm_iteration_limit" => options.max_iter,
        "time_limit" => options.time_limit, "output_flag" => options.disp, "log_to_console" => options.disp, "primal_feasibility_tolerance" => options.tol,
        "solver" => options.solve_method))

    if !(lb == []) && !(ub == [])
        @variable(model, lb[i] <= x[i = 1:length(f)] <= ub[i])
    else
        @variable(model, x[i = 1:length(f)])
    end

    @objective(model, Min, 0.5 * x' * H * x + f'x)

    if A == [] && !(Aeq == [])
        @constraint(model, con_eq, Aeq * x .== beq)

    elseif Aeq == [] && !(A == [])
        @constraint(model, con_ineq, A * x .<= b)

    elseif !(Aeq == []) && !(A == [])
        @constraint(model, con_ineq, A * x .<= b)
        @constraint(model, con_eq, Aeq * x .== beq)

    elseif Aeq == [] && A == []
        nothing
    else
        @warn "参数设置错误，请检查"
    end

    
    optimize!(model)
    res = JuMP.value.(x)
    obj = objective_value(model)

    if termination_status(model) == OPTIMAL || (termination_status(model) == TIME_LIMIT && has_values(model))
        success = true
    else
        success = false
    end

    if options.disp
        solution_summary(model, verbose = true)
    else
        set_silent(model)
    end

    a = OptimizeResult(name = "quadprog", H = H, f = f, success = success, x = res, A = A, b = b, Aeq = Aeq, beq = beq, lb = lb, ub = ub,
        fun = obj, method = "choose", model = model, options = options)

    return a

end

