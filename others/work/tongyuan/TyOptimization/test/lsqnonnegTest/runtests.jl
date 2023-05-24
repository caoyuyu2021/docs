using Test

tests = [
    "（调用接口1）非负线性最小二乘",
    "（调用接口2）具有非默认选项的非负线性最小二乘"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end