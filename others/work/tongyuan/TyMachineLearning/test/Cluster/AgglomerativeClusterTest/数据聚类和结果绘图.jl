using TyMachineLearning
using Test
using DataFrames
using CSV

@testset "数据聚类和结果绘图.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Cluster/linkage.csv")
    X = CSV.read(file, DataFrame; header=false)
    @test size(X) == (20000, 3)
    method = "ward"
    #数据聚类
    res = linkage(X, method)
    @test size(res) == (20000 - 1, 4)
end
