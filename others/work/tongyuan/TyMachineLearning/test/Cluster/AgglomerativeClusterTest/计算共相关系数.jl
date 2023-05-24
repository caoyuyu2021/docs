using TyMachineLearning
using Test
using DataFrames
using CSV

@testset "计算共相关系数.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Cluster/cophenet.csv")
    X = CSV.read(file, DataFrame; header=false)
    @test size(X) == (30, 3)
    Z = linkage(X, "single")
    #计算共相关系数
    @test size(cophenet(Z, X)[2]) == (435,)
end
