function ineq_cons(funcs, jacs)
    py"""
    from constrain_functions import *
    """
    py"ineq_cons"(funcs, jacs)
end

function ineq_cons(funcs)
    py"""
    from constrain_functions import *
    """
    py"ineq_cons2"(funcs)
end

function eq_cons(funcs, jacs)
    py"""
    from constrain_functions import *
    """
    py"eq_cons"(funcs, jacs)
end

function eq_cons(funcs)
    py"""
    from constrain_functions import *
    """
    py"eq_cons2"(funcs)
end


function fmincon(fun, x0::Vector, constraints::Vector)
    py"""
    from fmincon_functions import *
    """
    res_dict = py"SLSQP"(fun, x0, constraints = constraints)
    a = OptimizeResult(objfun = fun, name = "fmincon", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
        fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"],nfev = res_dict["nfev"])
    return a

end

function fmincon(fun, x0::Vector, constraints::Vector, bounds::Vector)
    py"""
    from fmincon_functions import *
    """
    res_dict = py"SLSQP"(fun, x0, constraints = constraints, bounds = bounds)
    a = OptimizeResult(objfun = fun, name = "fmincon", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
        fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
    return a

end

function fmincon(fun, x0::Vector, args::Tuple, constraints::Vector)
    py"""
    from fmincon_functions import *
    """
    res_dict = py"SLSQP"(fun, x0, args, constraints = constraints)
    a = OptimizeResult(objfun = fun, name = "fmincon", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
        fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
    return a

end

function fmincon(fun, x0::Vector, constraints::Vector,options)
    py"""
    from fmincon_functions import *
    """
    if options.algorithm == "SLSQP"
        res_dict = py"SLSQP"(fun, x0, (), options.jac, options.bounds, constraints, options.tol, options.callback, options.maxiter, options.ftol,
            options.iprint, options.disp, options.eps, options.finite_diff_rel_step)
        a = OptimizeResult(objfun = fun, name = "fmincon", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
            fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
        
    elseif options.algorithm == "trust-constr"
        res_dict = py"Trust_constr"(fun, x0, (), options.jac, options.hess, options.hessp, options.bounds, constraints, options.tol,
            options.callback, options.xtol, options.gtol, options.barrier_tol, options.sparse_jacobian, options.maxiter,
            options.verbose, options.finite_diff_rel_step, options.initial_constr_penalty, options.initial_tr_radius,
            options.initial_barrier_parameter, options.initial_barrier_tolerance, options.factorization_method,
            options.disp)
        a = OptimizeResult(objfun = fun, name = "fmincon", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
            fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
    elseif options.algorithm == "COBYLA"
        res_dict = py"COBYLA"(fun, x0, (), constraints, options.tol, options.callback, options.rhobeg, options.maxiter, options.disp,
            options.catol)
        a = OptimizeResult(objfun = fun, name = "fmincon", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
            fun = res_dict["fun"], method = res_dict["method"], nfev = res_dict["nfev"])
    else
    
        @error "算法设置错误，目前只能在[SLSQP,trust-constr,COBYLA]中选择"
    
    end

    return a
end

function fmincon(fun, x0::Vector, args::Tuple, constraints::Vector, options)
    py"""
    from fmincon_functions import *
    """
    if options.algorithm == "SLSQP"
        res_dict = py"SLSQP"(fun, x0, args, options.jac, options.bounds, constraints, options.tol, options.callback, options.maxiter, options.ftol,
            options.iprint, options.disp, options.eps, options.finite_diff_rel_step)
        a = OptimizeResult(objfun = fun, name = "fmincon", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
            fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
    elseif options.algorithm == "trust-constr"
        res_dict = py"Trust_constr"(fun, x0, args, options.jac, options.hess, options.hessp, options.bounds, constraints, options.tol,
            options.callback, options.xtol, options.gtol, options.barrier_tol, options.sparse_jacobian, options.maxiter,
            options.verbose, options.finite_diff_rel_step, options.initial_constr_penalty, options.initial_tr_radius,
            options.initial_barrier_parameter, options.initial_barrier_tolerance, options.factorization_method,
            options.disp)
        a = OptimizeResult(objfun = fun, name = "fmincon", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
            fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
    elseif options.algorithm == "COBYLA"
        res_dict = py"COBYLA"(fun, x0, args, constraints, options.tol, options.callback, options.rhobeg, options.maxiter, options.disp,
            options.catol)
        a = OptimizeResult(objfun = fun, name = "fmincon", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
            fun = res_dict["fun"], method = res_dict["method"], nfev = res_dict["nfev"])
    else

        @error "算法设置错误，目前只能在[SLSQP,trust-constr,COBYLA]中选择"

    end

    return a

end

function fmincon(fun, x0::Vector, A::Union{Matrix,Vector}, b::Vector, Aeq::Union{Matrix,Vector}, 
    beq::Vector, lb::Vector, ub::Vector, nonlcon::Vector, options, varargin...)
    ineq(x) = b - A * x
    eq(x) = beq - Aeq * x

    if lb == [] && ub == []
        bounds = None()
    elseif !(lb == []) && !(ub == [])
        bounds = [(lb[i], ub[i]) for i in 1:length(lb)]
    else
        @error "lb,ub 参数设置错误，请检查"
    end

    constraints = [ineq_cons(ineq), ineq_cons(nonlcon[1]), eq_cons(eq), eq_cons(nonlcon[2])]

    if A == []
        constraints = filter!(x -> x != ineq_cons(ineq), constraints)
    end

    if Aeq == []
        constraints = filter!(x -> x != eq_cons(eq), constraints)
    end

    if nonlcon[1] == []
        constraints = filter!(x -> x != ineq_cons(nonlcon[1]), constraints)
    end

    if nonlcon[2] == []
        constraints = filter!(x -> x != eq_cons(nonlcon[2]), constraints)
    end

    if constraints == []
        constraints = None()
    end

    py"""
    from fmincon_functions import *
    """
    if options.algorithm == "SLSQP"
        res_dict = py"SLSQP"(
            fun,
            x0,
            varargin,
            options.jac,
            bounds,
            constraints,
            options.tol,
            options.callback,
            options.maxiter,
            options.ftol,
            options.iprint,
            options.disp,
            options.eps,
            options.finite_diff_rel_step,
        )
        a = OptimizeResult(;
            objfun=fun,
            name="fmincon",
            status=res_dict["status"],
            success=res_dict["success"],
            x=res_dict["x"],
            fun=res_dict["fun"],
            method=res_dict["method"],
            niter=res_dict["nit"],
            nfev=res_dict["nfev"],
        )
    elseif options.algorithm == "trust-constr"
        res_dict = py"Trust_constr"(
            fun,
            x0,
            varargin,
            options.jac,
            options.hess,
            options.hessp,
            bounds,
            constraints,
            options.tol,
            options.callback,
            options.xtol,
            options.gtol,
            options.barrier_tol,
            options.sparse_jacobian,
            options.maxiter,
            options.verbose,
            options.finite_diff_rel_step,
            options.initial_constr_penalty,
            options.initial_tr_radius,
            options.initial_barrier_parameter,
            options.initial_barrier_tolerance,
            options.factorization_method,
            options.disp,
        )
        a = OptimizeResult(;
            objfun=fun,
            name="fmincon",
            status=res_dict["status"],
            success=res_dict["success"],
            x=res_dict["x"],
            fun=res_dict["fun"],
            method=res_dict["method"],
            niter=res_dict["nit"],
            nfev=res_dict["nfev"],
        )
    elseif options.algorithm == "COBYLA"
        res_dict = py"COBYLA"(
            fun,
            x0,
            varargin,
            constraints,
            options.tol,
            options.callback,
            options.rhobeg,
            options.maxiter,
            options.disp,
            options.catol,
        )
        a = OptimizeResult(;
            objfun=fun,
            name="fmincon",
            status=res_dict["status"],
            success=res_dict["success"],
            x=res_dict["x"],
            fun=res_dict["fun"],
            method=res_dict["method"],
            nfev=res_dict["nfev"],
        )
    else
        @error "算法设置错误，目前只能在[SLSQP,trust-constr,COBYLA]中选择"
    end

    return a
end



