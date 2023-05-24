using Test

tests = [
    "（调用接口1）二维非线性方程组的求解"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end