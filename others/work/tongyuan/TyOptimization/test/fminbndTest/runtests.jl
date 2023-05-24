using Test

tests = [
    "（调用接口1）sin最小值",
    "（调用接口1）求通过文件指定的函数的最小值",
    "（调用接口2）具有额外参数时求最小值",
    "（调用接口2）监视迭代",
    "输入参数个数不确定",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end