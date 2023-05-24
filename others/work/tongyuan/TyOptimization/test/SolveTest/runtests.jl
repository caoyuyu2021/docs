using Test

tests = [
    "（调用接口1）非线性规划问题"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end