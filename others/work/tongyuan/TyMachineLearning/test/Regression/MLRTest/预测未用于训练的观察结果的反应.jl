using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "预测未用于训练的观察结果的反应.jl" begin
    #读取数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/kfold_x.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/kfold_y.csv")
    X = CSV.read(file1, DataFrame; header=false)
    y = CSV.read(file2, DataFrame; header=false)
    @test size(X) == (1000, 1)
    @test size(y) == (1000, 1)
    #划分数据集
    res = kfoldPredict(X, y)
    @test res[1] > 1
end
