using TyMachineLearning
using CSV
using DataFrames
using Test

@testset "绘制响应与拟合值.jl" begin
    #加载数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/fitlm_X.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/fitlm_Y.csv")
    fgdata_x = CSV.read(file1, DataFrame; header=0)
    fgdata_y = CSV.read(file2, DataFrame; header=0)
    @test size(fgdata_x) == (100, 3)
    @test size(fgdata_y) == (100, 1)
    fgdata_x1 = Matrix(fgdata_x)
    fgdata_y1 = fgdata_y.Column1
    X = DataFrame([fgdata_x1 fgdata_y1], :auto)
    rename!(X, [:x4 => :y])
    modelspec = "y ~ x1+x2+x3"
    mdl, x_pre, y_pre = fitlm(X, modelspec)
    #计算响应向量
    res = TyMachineLearning.response(mdl, x_pre)
    @test length(res) == 93
end
