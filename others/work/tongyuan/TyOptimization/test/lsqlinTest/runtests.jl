using Test

tests = [
    "（调用接口1）具有边界约束的线性最小二乘",
    "（调用接口2）使用非默认选项"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end