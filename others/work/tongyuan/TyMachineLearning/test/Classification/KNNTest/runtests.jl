using Test

tests = ["训练k-最近邻分类器", "使用k-最近邻分类器预测标签", "计算欧几里得距离", "生成默认Kd-Tree"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
