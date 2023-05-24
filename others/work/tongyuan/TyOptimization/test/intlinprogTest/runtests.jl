using Test

tests = [
    "（调用接口1）求解具有线性不等式的 MILP",
    "（调用接口3）求解具有所有类型约束的MILP",
    "（调用接口4）使用非默认选项求解MILP"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end