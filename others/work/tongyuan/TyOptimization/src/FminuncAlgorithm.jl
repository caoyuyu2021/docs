function fminunc(fun, x0::Vector)
    py"""
    from fmincon_functions import *
    """
    res_dict = py"LBFGSB"(fun, x0)
    a = OptimizeResult(objfun = fun, name = "fmincon", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
        fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
    return a

end

function fminunc(fun, x0::Vector, options)
    py"""
    from fmincon_functions import *
    """
    if options.algorithm == "L-BFGS-B"
        res_dict = py"LBFGSB"(fun, x0, args = options.args, jac = options.jac, bounds = options.bounds, tol = options.tol, callback = options.callback, maxiter = options.maxiter,
            maxcor = options.maxcor, ftol = options.ftol, gtol = options.gtol, eps = options.eps, iprint = options.iprint, maxfun = options.maxfun, maxls = options.maxls,
            disp = options.disp, finite_diff_rel_step = options.finite_diff_rel_step)
        a = OptimizeResult(objfun = fun, name = "fmincon", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
            fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
    
    elseif options.algorithm == "Powell"
        res_dict = py"Powell"(fun, x0, args = options.args, bounds = options.bounds, tol = options.tol, callback = options.callback, maxiter = options.maxiter, xtol = options.xtol, ftol = options.ftol,
            maxfev = options.maxfev, direc = options.direc, return_all = options.return_all, disp = options.disp)
        if options.return_all
            a = OptimizeResult(objfun = fun, name = "fminsearch", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
                fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"], allvecs = res_dict["allvecs"])
        else
            a = OptimizeResult(objfun = fun, name = "fminsearch", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
                fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
        end
    elseif options.algorithm == "trust-krylov"
        res_dict = py"trust_krylov"(fun, x0, args = options.args, jac = options.jac, hess = options.hess, hessp = options.hessp, tol = options.tol, callback = options.callback, maxiter = options.maxiter,
            initial_trust_radius = options.initial_trust_radius, max_trust_radius = options.max_trust_radius, eta = options.eta, gtol = options.gtol, inexact = options.inexact,
            return_all = options.return_all, disp = options.disp)
    
        if options.return_all
            a = OptimizeResult(objfun = fun, name = "fminsearch", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
                fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"], allvecs = res_dict["allvecs"])
        else
            a = OptimizeResult(objfun = fun, name = "fminsearch", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
                fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
        end
    
    else
        error("算法参数不正确，目前只能在[L-BFGS-B，Powell，trust-krylov]中选择")
    end

    return a


end

function fminunc(prob)
    py"""
    from fmincon_functions import *
    """
    if prob.options.algorithm == "L-BFGS-B"
        res_dict = py"LBFGSB"(fun = prob.objective, x0 = prob.x0, args = prob.options.args, jac = prob.options.jac, bounds = prob.options.bounds, tol = prob.options.tol, callback = prob.options.callback,
            maxiter = prob.options.maxiter, maxcor = prob.options.maxcor, ftol = prob.options.ftol, gtol = prob.options.gtol, eps = prob.options.eps, iprint = prob.options.iprint,
            maxfun = prob.options.maxfun, maxls = prob.options.maxls, disp = prob.options.disp, finite_diff_rel_step = prob.options.finite_diff_rel_step)
        a = OptimizeResult(objfun = prob.objective, name = "fmincon", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
            fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
    elseif prob.options.algorithm == "Powell"
        res_dict = py"Powell"(fun = prob.objective, x0 = prob.x0, args = prob.options.args, bounds = prob.options.bounds, tol = prob.options.tol, callback = prob.options.callback,
            maxiter = prob.options.maxiter, xtol = prob.options.xtol, ftol = prob.options.ftol, maxfev = prob.options.maxfev, direc = prob.options.direc,
            return_all = prob.options.return_all, disp = prob.options.disp)
        if options.return_all
            a = OptimizeResult(objfun = prob.objective, name = "fminsearch", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
                fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"], allvecs = res_dict["allvecs"])
        else
            a = OptimizeResult(objfun = prob.objective, name = "fminsearch", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
                fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
        end
    elseif prob.options.algorithm == "trust-krylov"
        res_dict = py"trust_krylov"(fun = prob.objective, x0 = prob.x0, args = prob.options.args, jac = prob.options.jac, hess = prob.options.hess, hessp = prob.options.hessp, tol = prob.options.tol,
            callback = prob.options.callback, maxiter = prob.options.maxiter, initial_trust_radius = prob.options.initial_trust_radius, max_trust_radius = prob.options.max_trust_radius,
            eta = prob.options.eta, gtol = prob.options.gtol, inexact = prob.options.inexact, return_all = prob.options.return_all, disp = prob.options.disp)
        if options.return_all
            a = OptimizeResult(objfun = prob.objective, name = "fminsearch", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
                fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"], allvecs = res_dict["allvecs"])
        else
            a = OptimizeResult(objfun = prob.objective, name = "fminsearch", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
                fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
        end
    else
        error("算法参数不正确，只能在[L-BFGS-B，Powell，trust-krylov]中选择")
    end

    return a

end
