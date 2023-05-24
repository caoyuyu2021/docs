using DataFrames
using CSV
using TyMachineLearning
using Test
using PyCall
# using NearestNeighbors

@testset "生成默认的Kd树.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Cluster/KDTreeSearcher.csv")
    X = CSV.read(file, DataFrame; header=false)
    @test size(X) == (100, 2)
    #生成树
    X = Matrix(Matrix{Float64}(X)')
    Mdl = KDTreeSearcher(X)
    @test typeof(Mdl) <: PyObject
end
