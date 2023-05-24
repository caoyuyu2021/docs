using Test

tests = ["使用SVM学习器训练多类模型", "使用ECOC学习器预测标签"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
