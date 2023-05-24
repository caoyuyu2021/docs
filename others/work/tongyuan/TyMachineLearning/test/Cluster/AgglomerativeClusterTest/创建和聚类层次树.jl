using TyMachineLearning
using Test
using CSV
using DataFrames

@testset "创建和聚类层次树.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Cluster/clusterdata.csv")
    X = CSV.read(file, DataFrame; header=false)
    @test size(X) == (30, 3)
    cutoff = 3
    #创建聚类树
    res = clusterdata(X, cutoff)
    @test length(res) == 30
end
