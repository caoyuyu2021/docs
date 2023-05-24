using TyMachineLearning
using Test
using DataFrames
using CSV

@testset "不一致性系数计算.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Cluster/inconsistent.csv")
    X = CSV.read(file, DataFrame; header=false)
    @test size(X) == (120, 5)
    Z = linkage(X, "single")
    #计算不一致系数
    @test size(inconsistent(Z)) == (119, 4)
end
