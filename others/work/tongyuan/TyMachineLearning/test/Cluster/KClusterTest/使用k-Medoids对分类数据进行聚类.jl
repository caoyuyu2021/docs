using DataFrames
using TyMachineLearning
using Test
using CSV

@testset "使用k-Medoids对分类数据进行聚类.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Classification/iris.csv")
    iris = CSV.read(file, DataFrame; header=false)
    #划分数据集
    X = iris[:, 1:4]
    k = 3
    @test size(X) == (150, 4)
    #训练模型
    res = kmedoids(X, k)
    @test length(res) == size(X, 1)
end
