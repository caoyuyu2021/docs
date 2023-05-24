using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "偏最小二乘回归.jl" begin
    #读取数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/PLSR_x.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/PLSR_y.csv")
    X = CSV.read(file1, DataFrame; header=false)
    y = CSV.read(file2, DataFrame; header=false)
    @test size(X) == (60, 401)
    @test size(y) == (60, 1)
    #划分数据集
    ncomp = 10
    mdl, x1, y1 = plsregress(X, y, ncomp)
    @test size(mdl.x_loadings_) == (401, 10)
end
