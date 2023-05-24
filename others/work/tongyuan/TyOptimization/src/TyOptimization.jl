module TyOptimization
using PyCall
# function __init__()
#     pushfirst!(PyVector(pyimport("sys")."path"), joinpath(pwd(), "python"))
# end

function _set_python_path(path::AbstractString)
    py"""
    import sys
    def set_path(path):
        if path not in sys.path:
            sys.path.append(path)
    """
    py"set_path"(path)
end

function __init__()
    pypath = abspath(joinpath(@__DIR__, "..", "python"))
    _set_python_path(pypath)
end

function None() end

include("FminconAlogrithm.jl")
include("fmu_functions.jl")
include("FminbndAlogrithm.jl")
include("FzeroAlogrithm.jl")
include("SolveAlgorithm.jl")
include("FminsearchAlogrithm.jl")
include("FminuncAlgorithm.jl")
include("linprog.jl")
include("quadprog.jl")
include("root_finding.jl")
include("MultiOpt.jl")
include("leastsquares.jl")
include("linprog_options.jl")
include("options.jl")


# mutable struct optimproblem
#     Description::String     #优化问题描述
#     objective               #优化目标函数
#     x0                      #初始猜测值
#     args                    #优化目标函数参数
#     constraints             #优化约束
#     options                 #算法参数选项
# end

# mutable struct eqnproblem
#     Description::String     #方程问题描述
#     equations               #待求解方程
#     x0                      #初始猜测值
# end






function optimproblem()
    prob = optimproblem_default
    return prob
end

function eqnproblem()
    prob = eqnproblem_default
    return prob
end

const _EXCLUDE_SYMBOLS = [Symbol(@__MODULE__), :eval, :include]
for sym in names(@__MODULE__, all = true)
    sym_string = string(sym)
    if sym in _EXCLUDE_SYMBOLS ||
       startswith(sym_string, "_") ||
       startswith(sym_string, "@_")
        continue
    end
    if !(
        Base.isidentifier(sym) ||
        (startswith(sym_string, "@") && Base.isidentifier(sym_string[2:end]))
    )
        continue
    end
    @eval export $sym
end

end # module
