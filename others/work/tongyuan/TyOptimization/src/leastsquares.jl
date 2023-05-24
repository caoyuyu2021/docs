function lsqnonlin(fun, x0)
    py"""
    from least_squares import *
    """
    res_dict = py"lsqnonlin"(fun, x0)

    a = OptimizeResult(objfun = fun, name = "lsqnonlin", status = res_dict["status"], 
         success = res_dict["success"], x = res_dict["x"],fun = res_dict["fun"], 
         method = res_dict["method"], nfev = res_dict["nfev"])
    return a
end

function lsqnonlin(fun, x0, lb, ub)
    py"""
    from least_squares import *
    """
    res_dict = py"lsqnonlin"(fun, x0, lb, ub)
    a = OptimizeResult(objfun = fun, name = "lsqnonlin", status = res_dict["status"],
        success = res_dict["success"], x = res_dict["x"], fun = res_dict["fun"],
        method = res_dict["method"], nfev = res_dict["nfev"])
    return a
end

function lsqnonlin(fun, x0, lb, ub, options)
    py"""
    from least_squares import *
    """
    if lb == [] || ub == []
        lb = None()
        ub = None()
    end

    res_dict = py"lsqnonlin"(fun, x0, lb, ub, method = options.solve_method, ftol = options.ftol,
        xtol = options.xtol, gtol = options.gtol, x_scale = options.x_scale, loss = options.loss,
        f_scale = options.f_scale, max_nfev = options.max_nfev, verbose = options.verbose,
        args = options.args)

    a = OptimizeResult(objfun = fun, name = "lsqnonlin", status = res_dict["status"],
        success = res_dict["success"], x = res_dict["x"], fun = res_dict["fun"],
        method = res_dict["method"], nfev = res_dict["nfev"])
    return a
end


function lsqcurvefit(func, p0, xdata, ydata)
    py"""
    from least_squares import *
    """
    py"lsqcurvefit"(func, p0, xdata, ydata)
end

function lsqcurvefit(func, p0, xdata, ydata, lb, ub)
    py"""
    from least_squares import *
    """
    py"lsqcurvefit"(func, p0, xdata, ydata, lb, ub)
end

function lsqcurvefit(func, p0, xdata, ydata, lb, ub, options)
    py"""
    from least_squares import *
    """
    if p0 == []
        p0 = None()
    end

    if lb == [] || ub == []
        lb = None()
        ub = None()
    end

    py"lsqcurvefit"(func, p0, xdata, ydata, lb, ub, sigma = options.sigma,
        absolute_sigma = options.absolute_sigma, check_finite = options.check_finite,
        method = options.solve_method, jac = options.jac)
end

function lsqnonneg(A, b, options)
    py"""
    from least_squares import *
    """
    py"lsqnonneg"(A, b, options.max_iter)
end

function lsqnonneg(A, b)
    py"""
    from least_squares import *
    """
    py"lsqnonneg"(A, b)
end

# minimize 0.5 * ||A x - b||**2
# subject to lb <= x <= ub
function lsqlin(A, b, lb, ub)
    py"""
    from least_squares import *
    """
    res_dict = py"lsqlin"(A, b, lb, ub)

    a = OptimizeResult(name = "lsqlin", status = res_dict["status"],
        success = res_dict["success"], x = res_dict["x"], fun = res_dict["fun"],
        method = res_dict["method"], niter = res_dict["nit"])
    return a
end

function lsqlin(A, b, lb, ub, options)
    py"""
    from least_squares import *
    """
    if lb == [] || ub == []
        lb = None()
        ub = None()
    end

    res_dict = py"lsqlin"(A, b, lb, ub, method = options.solve_method, tol = options.tol,
        lsmr_tol = options.lsmr_tol,max_iter = options.max_iter, verbose = options.verbose)

    a = OptimizeResult(name = "lsqlin", status = res_dict["status"],
        success = res_dict["success"], x = res_dict["x"], fun = res_dict["fun"],
        method = res_dict["method"], niter = res_dict["nit"])
    return a
end
 