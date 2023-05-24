using Test

tests = [
    "交叉验证决策树",
    "交叉验证分区回归模型的损失",
    "使用回归树预测响应",
    "回归拟合二叉决策树",
    "回归树的预测重要性估计",
    "在交叉验证回归模型中预测观测响应",
    "计算部分相关性",
    "查看回归树",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
