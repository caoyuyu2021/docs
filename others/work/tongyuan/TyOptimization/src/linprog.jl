using JuMP
using HiGHS

function linprog(f::Vector, A::Union{Matrix,Vector}, b::Vector)
    model = Model(HiGHS.Optimizer)
    @variable(model, x[i=1:length(f)])
    @objective(model, Min, f' * x)
    @constraint(model, c1, A * x .<= b)
    optimize!(model)

    sol = JuMP.value.(x)#解
    obj = objective_value(model)#目标

    if termination_status(model) == OPTIMAL ||
        (termination_status(model) == TIME_LIMIT && has_values(model))
        success = true
    else
        success = false
    end

    a = OptimizeResult(f=f, A=A, b=b, success=success, x=sol, fun=obj, method="dual simplex", model=model
    )

    return a
end

function linprog(
    f::Vector, A::Union{Matrix,Vector}, b::Vector, Aeq::Union{Matrix,Vector}, beq::Vector
)
    model = Model(HiGHS.Optimizer)
    @variable(model, x[i=1:length(f)])
    @objective(model, Min, f' * x)
    @constraint(model, c1, A * x .<= b)
    @constraint(model, c2, Aeq * x .== beq)
    optimize!(model)

    sol = JuMP.value.(x)#解
    obj = objective_value(model)#目标

    if termination_status(model) == OPTIMAL ||
        (termination_status(model) == TIME_LIMIT && has_values(model))
        success = true
    else
        success = false
    end

    a = OptimizeResult(
        f=f, A=A, b=b, success=success, x=sol, fun=obj, method="dual simplex", model=model
    )

    return a
end

function linprog(
    f::Vector,
    A::Union{Matrix,Vector},
    b::Vector,
    Aeq::Union{Matrix,Vector},
    beq::Vector,
    lb::Vector,
    ub::Vector,
)
    model = Model(HiGHS.Optimizer)

    @variable(model, x[i=1:length(f)])
    set_lower_bound.(x, lb)
    set_upper_bound.(x, ub)

    @objective(model, Min, f' * x)
    @constraint(model, c1, A * x .<= b)
    @constraint(model, c2, Aeq * x .== beq)
    print(model)
    optimize!(model)

    sol = JuMP.value.(x)#解
    obj = objective_value(model)#目标

    if termination_status(model) == OPTIMAL ||
        (termination_status(model) == TIME_LIMIT && has_values(model))
        success = true
    else
        success = false
    end

    a = OptimizeResult(;
        f=f, A=A, b=b, success=success, x=sol, fun=obj, method="dual simplex", model=model
    )

    return a
end

# function linprog(
#     f::Vector,
#     A::Union{Matrix,Vector},
#     b::Vector,
#     Aeq::Union{Matrix,Vector},
#     beq::Vector,
#     lb::Vector,
#     ub::Vector,
# )
#     bounds = [(lb[i], ub[i]) for i in 1:length(lb)]

#     py"""
#     from linear_program  import *
#     """
#     res_dict = py"linprog2"(f, A, b, Aeq, beq, bounds)
#     a = OptimizeResult(;
#         f=f,
#         A=A,
#         b=b,
#         Aeq=Aeq,
#         beq=beq,
#         lb=lb,
#         ub=ub,
#         status=res_dict["status"],
#         success=res_dict["success"],
#         x=res_dict["x"],
#         fun=res_dict["fun"],
#         method=res_dict["method"],
#         niter=res_dict["nit"],
#     )
#     return a
# end

function linprog(
    f::Vector,
    A::Union{Matrix,Vector},
    b::Vector,
    Aeq::Union{Matrix,Vector},
    beq::Vector,
    lb::Vector,
    ub::Vector,
    options,
)
    if lb == [] && ub == []
        bounds = None()
    else
        bounds = [(lb[i], ub[i]) for i in 1:length(lb)]
    end

    if A == []
        A = None()
        b = None()
    end

    if Aeq == []
        Aeq = None()
        beq = None()
    end

    if options.algorithm == "highs"
        options_new = Dict(
            "maxiter" => options.maxiter,
            "disp" => options.disp,
            "presolve" => options.presolve,
            "time_limit" => options.time_limit,
            "dual_feasibility_tolerance" => options.dual_feasibility_tolerance,
            "primal_feasibility_tolerance" => options.primal_feasibility_tolerance,
            "ipm_optimality_tolerance" => options.ipm_optimality_tolerance,
            "simplex_dual_edge_weight_strategy " =>
                options.simplex_dual_edge_weight_strategy,
        )
    elseif options.algorithm == "highs-ipm"
        options_new = Dict(
            "maxiter" => options.maxiter,
            "disp" => options.disp,
            "presolve" => options.presolve,
            "time_limit" => options.time_limit,
            "dual_feasibility_tolerance" => options.dual_feasibility_tolerance,
            "primal_feasibility_tolerance" => options.primal_feasibility_tolerance,
            "ipm_optimality_tolerance" => options.ipm_optimality_tolerance,
        )
    elseif options.algorithm == "highs-ds"
        options_new = Dict(
            "maxiter" => options.maxiter,
            "disp" => options.disp,
            "presolve" => options.presolve,
            "time_limit" => options.time_limit,
            "dual_feasibility_tolerance" => options.dual_feasibility_tolerance,
            "primal_feasibility_tolerance" => options.primal_feasibility_tolerance,
            "simplex_dual_edge_weight_strategy " =>
                options.simplex_dual_edge_weight_strategy,
        )
    end

    py"""
    from linear_program  import *
    """

    res_dict = py"linprog2"(
        f, A, b, Aeq, beq, bounds; method=options.algorithm, options=options_new
    )
    a = OptimizeResult(;
        f=f,
        A=A,
        b=b,
        Aeq=Aeq,
        beq=beq,
        lb=lb,
        ub=ub,
        status=res_dict["status"],
        success=res_dict["success"],
        x=res_dict["x"],
        fun=res_dict["fun"],
        method=res_dict["method"],
        niter=res_dict["nit"],
        options=options,
    )

    return a
end

function intlinprog(f::Vector, intcon::Vector, A::Matrix, b::Vector)
    model = direct_model(HiGHS.Optimizer())
    @variable(model, x[i=1:length(f)])
    for i in intcon
        set_integer(x[i])
    end

    @objective(model, Min, f'x)

    if !(A == [])
        @constraint(model, con, A * x .<= b)
    else
        nothing
    end

    set_silent(model)
    optimize!(model)

    if termination_status(model) == OPTIMAL ||
        (termination_status(model) == TIME_LIMIT && has_values(model))
        success = true
    else
        success = false
    end

    res = JuMP.value.(x)
    obj = objective_value(model)

    a = OptimizeResult(;
        name="intlinprog",
        f=f,
        A=A,
        b=b,
        success=success,
        x=res,
        fun=obj,
        method="choose",
        model=model,
    )

    return a
end

function intlinprog(
    f::Vector, intcon::Vector, A::Matrix, b::Vector, Aeq::Matrix, beq::Vector
)
    model = direct_model(HiGHS.Optimizer())
    @variable(model, x[i=1:length(f)])
    for i in intcon
        set_integer(x[i])
    end

    @objective(model, Min, f'x)

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

    if termination_status(model) == OPTIMAL ||
        (termination_status(model) == TIME_LIMIT && has_values(model))
        success = true
    else
        success = false
    end

    res = JuMP.value.(x)
    obj = objective_value(model)

    a = OptimizeResult(;
        name="intlinprog",
        f=f,
        A=A,
        b=b,
        success=success,
        x=res,
        Aeq=Aeq,
        beq=beq,
        fun=obj,
        method="choose",
        model=model,
    )

    return a
end

function intlinprog(
    f::Vector,
    intcon::Vector,
    A::Matrix,
    b::Vector,
    Aeq::Matrix,
    beq::Vector,
    lb::Vector,
    ub::Vector,
)
    model = direct_model(HiGHS.Optimizer())
    @variable(model, lb[i] <= x[i=1:length(f)] <= ub[i])
    for i in intcon
        set_integer(x[i])
    end

    @objective(model, Min, f'x)

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

    if termination_status(model) == OPTIMAL ||
        (termination_status(model) == TIME_LIMIT && has_values(model))
        success = true
    else
        success = false
    end

    res = JuMP.value.(x)
    obj = objective_value(model)

    a = OptimizeResult(;
        name="intlinprog",
        f=f,
        A=A,
        b=b,
        success=success,
        x=res,
        Aeq=Aeq,
        beq=beq,
        lb=lb,
        ub=ub,
        fun=obj,
        method="choose",
        model=model,
    )

    return a
end

function intlinprog(
    f::Vector,
    intcon::Vector,
    A::Union{Matrix,Vector},
    b::Vector,
    Aeq::Union{Matrix,Vector},
    beq::Vector,
    lb::Vector,
    ub::Vector,
    options,
)
    model = Model(
        optimizer_with_attributes(
            HiGHS.Optimizer,
            "simplex_iteration_limit" => options.max_iter,
            "ipm_iteration_limit" => options.max_iter,
            "time_limit" => options.time_limit,
            "output_flag" => options.disp,
            "log_to_console" => options.disp,
            "primal_feasibility_tolerance" => options.tol,
            "solver" => options.solve_method,
        ),
    )

    @variable(model, lb[i] <= x[i=1:length(f)] <= ub[i])
    for i in intcon
        set_integer(x[i])
    end

    @objective(model, Min, f'x)

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

    if termination_status(model) == OPTIMAL ||
        (termination_status(model) == TIME_LIMIT && has_values(model))
        success = true
    else
        success = false
    end

    if options.disp
        solution_summary(model; verbose=true)
    else
        set_silent(model)
    end

    a = OptimizeResult(;
        name="intlinprog",
        f=f,
        A=A,
        b=b,
        success=success,
        x=res,
        Aeq=Aeq,
        beq=beq,
        lb=lb,
        ub=ub,
        options=options,
        fun=obj,
        method="choose",
        model=model,
    )

    return a
end