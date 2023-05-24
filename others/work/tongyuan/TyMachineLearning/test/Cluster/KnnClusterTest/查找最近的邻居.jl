using DataFrames
using CSV
using TyMachineLearning
using Test

@testset "查找最近的邻居.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Cluster/KDTreeSearcher.csv")
    X1 = CSV.read(file, DataFrame; header=false)
    Y1 = [20 162; 30 169; 40 168; 50 170; 60 171]
    X1 = Matrix(X1)
    @test size(X1, 2) == size(Y1, 2)
    mdl = ExhaustiveSearcher(X1)
    distances, indices = knnsearch(mdl, Y1; n_neighbors=1)
    @test length(indices) == 5
end
