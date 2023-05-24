using Test

tests = ["使用k-Medoids对分类数据进行聚类", "训练k均值聚类算法"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
