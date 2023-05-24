using Test

tests = [
    "创建回归树袋模型",
    "创建阿达回归树模型",
    "去除na值",
    "回归器集合",
    "线性回归模式下随机噪声响应的模拟",
    "袋装支持向量机回归模型",
    "集成模型的袋外损失",
    "创建梯度树提升回归模型",
    "投票回归器",
    "基于直方图的梯度提升回归器",
    "拟合随机森林回归器模型"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
