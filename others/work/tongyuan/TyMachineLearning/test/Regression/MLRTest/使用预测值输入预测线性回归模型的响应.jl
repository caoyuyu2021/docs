using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "使用预测值输入预测线性回归模型的响应.jl" begin
    #数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/Fitglm_x.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/Fitglm_y.csv")
    fgdata_x = CSV.read(file1, DataFrame; header=0)
    fgdata_y = CSV.read(file2, DataFrame; header=0)
    X, y = Matrix(fgdata_x), fgdata_y.Column1
    mdl_lm = fitlm(X, y)
    res = TyMachineLearning.predict(mdl_lm, X[1:5, :])
    @test size(res) == (5,)
end
