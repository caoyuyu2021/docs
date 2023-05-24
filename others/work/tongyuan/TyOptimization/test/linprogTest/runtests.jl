using Test

tests = [
    "（调用接口1）线性规划，线性不等式约束",
    "（调用接口2）具有线性不等式和等式的线性规划",
    "（调用接口3）具有所有约束类型的线性规划",
    "（调用接口4）使用“interior-point”算法的线性规划"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end