using Test

tests = [
    "（调用接口1）获取最佳目标函数值",
    "（调用接口1）最小化多项式",
    "（调用接口2）检查求解过程",
    "（调用接口2）提供梯度",
    "（调用接口3）使用问题结构体"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end