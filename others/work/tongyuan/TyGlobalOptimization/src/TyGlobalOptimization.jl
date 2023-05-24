module TyGlobalOptimization

using PyCall
using TyBase
using TyPlot

#导出Evolutionary模块中的所有符号(容易出错)
# using Reexport
# @reexport using Evolutionary





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

function None() end                                                          #空函数                                             

include("type_define.jl")
include("common_function.jl")
include("simulatedannealing.jl")
include("pso_algorithms.jl")
include("ga_algorithms.jl")
include("sa_algorithms.jl")
include("gamultiobj_algorithms.jl")
include("ps.jl")
include("ps_algorithms.jl")
include("DMS.jl")
include("paretosearch_algorithms.jl")
include("surrogateopt.jl")
include("multistart_algorithms.jl")

#导出模块中的函数
const _EXCLUDE_SYMBOLS = [Symbol(@__MODULE__), :eval, :include]
for sym in names(@__MODULE__, all=true)
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


# export SPX, TPX, SHFX, UX, BINX, EXPX, BSX,
#     DC, AX, WAX, IC, LC, HX, LX, MILX, SBX,
#     PMX, OX1, CX, OX2, POS, SSX
# export ranklinear, uniformranking, roulette, rouletteinv, sus, susinv, truncation, tournament
# export flip, bitinversion,
#     uniform, gaussian, BGA, PM, MIPM, PLM,
#     inversion, insertion, swap2, scramble, shifting, replace


end
