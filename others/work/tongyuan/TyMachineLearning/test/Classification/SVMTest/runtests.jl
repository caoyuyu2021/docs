using Test

tests = [
    "训练SVM分类器", "使用SVM分类器预测标签", "训练线性分类模型", "使用线性分类模型预测标签", "训练高斯核回归模型", "使用高斯核回归模型预测标签"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
