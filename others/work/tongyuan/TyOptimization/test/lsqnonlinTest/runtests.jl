using Test

tests = [
    "（调用接口1）拟合简单指数",
    "（调用接口2）拟合具有边界的约束问题",
    "（调用接口3）非线性最小二乘运算"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end