using Test

tests = [
    "（调用接口1）一个初始点处的根",
    "（调用接口2）解的详细信息（ToDo）",
    "（调用接口2）某初始区间内的根",
    "（调用接口2）文件定义的函数的根",
    "（调用接口3）非默认选项",
    "（调用接口3）具有额外参数的函数的根"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end