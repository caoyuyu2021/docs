function fminbnd(fun::Function, x1, x2)
    bounds = (x1, x2)
    py"""
    from fminbnd_functions import *
    """
    res_dict = py"fminbnd"(fun, bounds)
    a = OptimizeResult(objfun = fun,name="fminbnd",status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
        fun = res_dict["fun"], method = res_dict["method"],  nfev = res_dict["nfev"])
    return a

end

function fminbnd(fun::Function, x1, x2, options)
    bounds = (x1, x2)
    py"""
    from fminbnd_functions import *
    """
    if !(options.solvername=="fminbnd")
        error("options设置有误，请设置求解起名称为fminbnd")
    end
    res_dict = py"fminbnd"(fun, bounds, options.args, options.tol, options.maxiter, options.disp, options.xatol)

    a = OptimizeResult(objfun = fun, name = "fminbnd", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
        fun = res_dict["fun"], method = res_dict["method"], nfev = res_dict["nfev"])
    return a

end

function fminbnd(fun::Function, x1, x2, options, varargin...)
    options.args = varargin
    bounds = (x1, x2)
    py"""
    from fminbnd_functions import *
    """
    if !(options.solvername == "fminbnd")
        error("options设置有误，请设置求解器名称为fminbnd")
    end
    res_dict = py"fminbnd"(
        fun, bounds, options.args, options.tol, options.maxiter, options.disp, options.xatol
    )

    a = OptimizeResult(;
        objfun=fun,
        name="fminbnd",
        status=res_dict["status"],
        success=res_dict["success"],
        x=res_dict["x"],
        fun=res_dict["fun"],
        method=res_dict["method"],
        nfev=res_dict["nfev"],
    )
    return a
end



