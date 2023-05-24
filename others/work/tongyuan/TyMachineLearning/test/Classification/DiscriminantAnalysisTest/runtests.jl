using Test

tests = ["训练判别分析模型", "使用判别分析预测标签"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
