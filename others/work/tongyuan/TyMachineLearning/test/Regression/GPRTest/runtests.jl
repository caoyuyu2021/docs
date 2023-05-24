using Test

tests = ["交叉验证高斯过程回归模型", "拟合高斯过程回归模型", "高斯过程回归模型的回归误差", "高斯过程回归模型的预测响应", "计算部分相关性"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
