using Test

tests = [
    "（调用接口3）具有线性约束的二次规划",
    "（调用接口3）具有线性等式约束的二次规划",
    "（调用接口4）具有线性约束和边界的二次最小化",
    "（调用接口5）使用非默认选项的二次最小化"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end