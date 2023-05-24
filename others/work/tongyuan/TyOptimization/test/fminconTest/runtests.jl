using Test

tests = [
    "（调用接口1）线性不等式和等式约束",
    "（调用接口1）线性不等式约束",
    "（调用接口2）非线性约束",
    "（调用接口2）具有边界约束的最小化",
    "（调用接口4）非默认选项",
    "（调用接口4）使用梯度",
    "输入参数个数不确定",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end