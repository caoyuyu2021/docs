using Test
using TyMachineLearning
using CSV
using DataFrames
using PyCall

@testset "使用SVM学习器训练多类模型.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Classification/iris.csv")
    iris = CSV.read(file, DataFrame; header=false)
    @test size(iris, 1) == 150
    @test size(iris, 2) == 5
    #划分数据集
    X = iris[1:2:end, 1:4]
    y = iris[1:2:end, 5]
    #训练模型
    mdl = fitcecoc(X, y)
    @test typeof(mdl) <: PyObject
end
