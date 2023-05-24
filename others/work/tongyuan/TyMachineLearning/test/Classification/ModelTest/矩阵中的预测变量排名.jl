using Test
using TyMachineLearning
using CSV
using DataFrames

@testset "矩阵中的预测变量排名.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Classification/ionosphere.csv")
    ionosphere = CSV.read(file, DataFrame; header=false)
    @test size(ionosphere) == (351, 35)
    #划分数据集
    X = ionosphere[:, 1:34]
    y = ionosphere[:, 35]
    res = fscchi2(X, y)
    @test length(res[1]) == length(res[2])
end
