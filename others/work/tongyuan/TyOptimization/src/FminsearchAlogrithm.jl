function fminsearch(fun, x0)
    py"""
    from fmincon_functions import *
    """
    res_dict = py"NelderMead"(fun, x0)
    a = OptimizeResult(objfun = fun, name = "fminsearch", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
        fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])

    return a

end

function fminsearch(fun, x0, bounds::Vector)
    py"""
    from fmincon_functions import *
    """
    res_dict = py"NelderMead"(fun, x0, bounds = bounds)

    a = OptimizeResult(objfun = fun, name = "fminsearch", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
        fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])

    return a

end

function fminsearch(fun, x0, options)

    if !(options.algorithm == "Nelder-Mead")
        error("算法选择错误，只能为Nelder-Mead")
    end

    py"""
    from fmincon_functions import *
    """
    res_dict = py"NelderMead"(fun, x0, args = options.args, bounds = options.bounds, tol = options.tol, callback = options.callback, maxiter = options.maxiter, maxfev = options.maxfev, disp = options.disp, return_all = options.return_all, initial_simplex = options.initial_simplex,
        xatol = options.xatol, fatol = options.fatol, adaptive = options.adaptive)
    if options.return_all
        a = OptimizeResult(objfun = fun, name = "fminsearch", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
          fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"], allvecs = res_dict["allvecs"])
    else
        a = OptimizeResult(objfun = fun, name = "fminsearch", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
          fun = res_dict["fun"], method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
    end

    return a
end




