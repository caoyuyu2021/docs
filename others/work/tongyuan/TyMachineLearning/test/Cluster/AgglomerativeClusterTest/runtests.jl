using Test

tests = [
    "聚类数据和绘图结果",
    "创建和聚类层次树",
    "计算共相关系数",
    "不一致性系数计算",
    "数据聚类和结果绘图",
    "计算欧几里德距离并将距离向量转换为矩阵",
    "计算欧氏距离并将距离向量转换为矩阵",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
