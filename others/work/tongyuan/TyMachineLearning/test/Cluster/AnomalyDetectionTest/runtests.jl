using Test

tests = [
    "使用隔离林查找数据中的异常",
    "建立局部异常点因子模型进行异常检测",
    "拟合一类支持向量机模型进行异常检测",
    "拟合隔离林用于异常检测",
    "稳健的多元协方差和均值估计",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
