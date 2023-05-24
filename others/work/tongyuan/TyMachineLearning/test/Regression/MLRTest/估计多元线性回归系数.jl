using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "估计多元线性回归系数.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Regression/regress.csv")
    X = CSV.read(file, DataFrame; header=false)
    @test size(X) == (100, 3)
    #确定x1、x2为预测变量，y为响应
    x1 = X[:, 2]
    x2 = X[:, 1]
    y = X[:, 3]
    X = [ones(size(x1)) x1 x2 x1 .* x2]
    #计算并输出具有交互效应项的线性模型的回归系数。
    #res = regress(X, y)
    @test size(X) == (100, 4)
end
