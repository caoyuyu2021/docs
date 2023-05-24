using Test

tests = [
    "（调用接口1）计算 Rosenbrock 函数的最小值",
    "（调用接口1）求通过文件指定的函数的最小值",
    "（调用接口3）监视优化过程",
    "（调用接口3）具有额外参数时求最小值"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end