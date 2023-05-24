using Test

tests = ["训练朴素贝叶斯分类器", "使用朴素贝叶斯分类器预测标签"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
