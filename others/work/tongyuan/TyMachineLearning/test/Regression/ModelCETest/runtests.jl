using Test

tests = [
    "回归树的预测重要性估计",
    "回归树随机森林的预测值排列的预测值重要性估计",
    "基于F检验的回归单变量特征排序",
    "线性回归模型对象的Durbin-Watson检验",
    "线性回归模型系数估计的置信区间",
    "线性回归模型系数的线性假设检验",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
