using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "带剩余输入的Durbin-Watson检验.jl" begin
    #读取数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/dw_x.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/dw_y.csv")
    x = CSV.read(file1, DataFrame; header=false)
    y = CSV.read(file2, DataFrame; header=false)
    @test size(x) == (21, 1)
    @test size(y) == (21, 1)
    modelspec = "y~C(x)"
    x = Array(x)
    y = Array(y)
    model = Mdl_dw(x, y, modelspec)
    res = dwtest(model)
    @test res > 0
end
