using DataFrames
using CSV
using TyMachineLearning
using Test

@testset "使用Kd-tree和穷举搜索在半径内搜索邻居.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Cluster/rangesearch.csv")
    X = CSV.read(file, DataFrame; header=0)
    X = X[:, 3:4]
    @test size(X) == (145, 2)
    Y = [
        5.1000 3.5000 1.4000 0.2000
        4.6000 3.6000 1.0000 0.2000
        4.8000 3.0000 1.4000 0.3000
        6.0000 2.2000 4.0000 1.0000
        6.7000 2.5000 5.8000 1.8000
    ][
        :, 3:4
    ]
    X = Matrix(X)
    Mdl = ExhaustiveSearcher(X)
    @test size(X, 2) == size(Y, 2)
    #搜索邻居
    dis1, idx1 = rangesearch(Mdl, Y; radius=0.15)
    @test length(idx1) <= size(X, 1)
end