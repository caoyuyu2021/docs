using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "广义线性回归模型的预测响应.jl" begin
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/Fitglm_x.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/Fitglm_y.csv")
    fgdata_x = CSV.read(file1, DataFrame; header=0)
    fgdata_y = CSV.read(file2, DataFrame; header=0)
    fgdata_x1 = Matrix(fgdata_x)
    fgdata_y1 = fgdata_y.Column1
    X, y = Matrix(fgdata_x), fgdata_y.Column1
    mdl_glm = fitglm(X, y; family_clsa="Gaussian")
    res = TyMachineLearning.predict(mdl_glm, X[1:5, :])
    @test size(res) == (5,)
end
