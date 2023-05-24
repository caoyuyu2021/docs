using DataFrames
using CSV
using TyMachineLearning
using Test

@testset "对输入数据执行DBSCAN.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Cluster/2dcircular.csv")
    X = CSV.read(file, DataFrame; header=false)
    X = Matrix(X)
    dbs = dbscan(X; eps=1)
    group = dbs.labels_
    @test length(group) == size(X, 1)
end
