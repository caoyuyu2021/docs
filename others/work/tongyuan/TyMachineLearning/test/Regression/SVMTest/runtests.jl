using Test

tests = ["交叉验证支持向量机回归模型", "拟合支持向量机回归模型", "用支持向量机回归模型预测反应", "计算部分相关性"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
