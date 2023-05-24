using TyGlobalOptimization
using Test

tests = [
    "（调用接口1）输入输出类型",
    "（调用接口2）输入输出类型"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end