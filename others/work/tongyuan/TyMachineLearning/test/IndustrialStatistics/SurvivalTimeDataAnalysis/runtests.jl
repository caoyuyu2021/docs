using Test
using TyMachineLearning

tests = [
    "伽马参数估计",
    "单变量和双变量数据的核平滑函数估计",
    "威布尔参数估计",
    "对数据进行概率分布对象拟合",
    "对数正态参数估计",
    "指数参数估计",
    "最大似然估计",
    "极值参数估计",
    "正态参数估计",
    "经验累积分布函数",
    "考克斯比例风险回归",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
