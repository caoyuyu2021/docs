using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "创建广义线性回归模型.jl" begin
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/Fitglm_x.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/Fitglm_y.csv")
    fgdata_x = CSV.read(file1, DataFrame; header=0)
    fgdata_y = CSV.read(file2, DataFrame; header=0)
    fgdata_x1 = Matrix(fgdata_x)
    fgdata_y1 = fgdata_y.Column1
    X, y = Matrix(fgdata_x), fgdata_y.Column1
    mdl_lm = fitlm(X, y)
    mdl_glm = fitglm(X, y; family_clsa="Gamma")
    @test size(mdl_glm.pvalues) == (8,)
end
