using Test

tests = [
    "（调用接口1）简单指数拟合",
    "（调用接口2）具有边界约束的最佳拟合"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end