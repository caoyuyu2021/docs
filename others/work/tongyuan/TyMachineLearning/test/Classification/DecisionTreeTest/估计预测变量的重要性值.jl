using Test
using TyMachineLearning
using DataFrames
using CSV

@testset "估计预测变量的重要性值.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Classification/iris.csv")
    iris = CSV.read(file, DataFrame; header=false)
    @test size(iris) == (150, 5)
    #划分数据集
    X = iris[1:2:end, 1:4]
    y = iris[1:2:end, 5]
    res = predictorImportance(X, y)
    @test sum(res) == 1.0
end
