using Test

tests = [
    "（调用接口1）求解线性约束minimax问题",
    "（调用接口2）最小化sin和cos的最大值"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end