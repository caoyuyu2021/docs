using Test

tests = ["非线性回归模型的预测响应", "非线性回归", "评估非线性回归模型预测", "创建虚拟变量", "计算部分相关性", "非线性回归置信区间"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
