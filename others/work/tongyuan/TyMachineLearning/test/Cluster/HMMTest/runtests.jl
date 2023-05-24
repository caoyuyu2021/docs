using Test

tests = [
    "计算隐马尔可夫模型后验状态概率",
    "隐马尔可夫模型参数估计",
    "来自观测序列的隐马尔可夫模型参数估计",
    "隐马尔可夫模型最可能状态路径",
    "计算隐马尔可夫模型的状态与观测序列",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
