function fzero(fun, x0::Tuple)
    py"""
    from fzero_functions import *
    """
    res_dict = py"fzero"(fun, method = "secant", x0 = x0[1], x1 = x0[2])

    a = OptimizeResult(objfun = fun, name = "fzero",  success = res_dict["success"], x = res_dict["x"],
       method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])

    return a

end

function fzero(fun, bracket::Vector)
    py"""
    from fzero_functions import *
    """
    res_dict = py"fzero"(fun, method = "brentq", bracket = bracket)

    a = OptimizeResult(objfun = fun, name = "fzero", success = res_dict["success"], x = res_dict["x"],
        method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])

    return a

end

function fzero(fun, x0::Tuple, options)

    if !(options.solvername == "fzero")
        error("options设置有误，请设置求解起名称为fzero")
    end

    if !(options.algorithm == "secant")
        @warn "算法已经重置，必须为secant"
    end

    py"""
    from fzero_functions import *
    """
    res_dict = py"fzero"(fun, args = options.args, method = "secant", fprime = options.fprime, fprime2 = options.fprime2,
        xtol = options.xtol, rtol = options.rtol, maxiter = options.maxiter, x0 = x0[1], x1 = x0[2])
    a = OptimizeResult(objfun = fun, name = "fzero", success = res_dict["success"], x = res_dict["x"],
        method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])

    return a

end

function fzero(fun, bracket::Vector, options)

    if !(options.solvername == "fzero")
        error("options设置有误，请设置求解起名称为fzero")
    end

    py"""
    from fzero_functions import *
    """
    if !(options.algorithm in ["bisect", "brentq", "brenth", "ridder", "toms748"])
        @warn "算法不在可选择范围内，方程求根算法重置为brentq"
        res_dict = py"fzero"(fun, args = options.args, method = "brentq", fprime = options.fprime, fprime2 = options.fprime2,
            xtol = options.xtol, rtol = options.rtol, maxiter = options.maxiter, bracket = bracket)
        a = OptimizeResult(objfun = fun, name = "fzero", success = res_dict["success"], x = res_dict["x"],
            method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
    else
        res_dict = py"fzero"(fun, args = options.args, method = options.algorithm, fprime = options.fprime, fprime2 = options.fprime2,
            xtol = options.xtol, rtol = options.rtol, maxiter = options.maxiter, bracket = bracket)
        a = OptimizeResult(objfun = fun, name = "fzero", success = res_dict["success"], x = res_dict["x"],
            method = res_dict["method"], niter = res_dict["nit"], nfev = res_dict["nfev"])
    end

    return a

end




