using Test
using TyMachineLearning
using CSV
using DataFrames
using PyCall

@testset "生成默认Kd-Tree.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Classification/iris.csv")
    iris = CSV.read(file, DataFrame; header=false)
    @test size(iris) == (150, 5)
    #训练模型
    X = iris[:, 1:4]
    @test typeof(KDTreeSearcher(X)) <: PyObject
end
