using Test

tests = ["查看训练的分类树", "估计预测变量的重要性值", "生成分类树", "使用分类树预测标签", "交叉验证分类边缘", "分类边距的加权平均", "交叉验证分类边距", "模型函数交叉验证", "计算分类边距"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
