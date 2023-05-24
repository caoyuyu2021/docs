using Test
using TyMachineLearning
using CSV
using DataFrames
using PyCall

@testset "使用高斯核回归模型预测标签.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Classification/carsmall.csv")
    carsmall = CSV.read(file, DataFrame; header=false)
    @test size(carsmall) == (100, 3)
    #划分数据集
    X, y = dropna(carsmall)
    #训练模型
    mdl = fitrkernel(X, y)
    @test length(TyMachineLearning.predict(mdl, X)) == size(X, 1)
end
