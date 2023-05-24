function fsolve(fun, x0::Union{Vector,Matrix})
    py"""
    from root_finding_py import *
    """
    res_dict = py"fsolve"(fun, x0)
    a = OptimizeResult(name = "fsolve", status = res_dict["status"], success = res_dict["success"], x = res_dict["x"],
        fun = res_dict["fun"], method = res_dict["method"])

    return a

end