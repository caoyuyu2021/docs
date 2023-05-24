using Test

tests = ["高斯混合分布的随机变量", "使用高斯混合模型对数据进行聚类", "使用gmdistribution创建高斯混合分布", "计算后验概率"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
