using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "广义线性回归模型系数的线性假设检验.jl" begin
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/Fitglm_x.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/Fitglm_y.csv")
    fgdata_x = CSV.read(file1, DataFrame; header=0)
    fgdata_y = CSV.read(file2, DataFrame; header=0)
    fgdata_x1 = Matrix(fgdata_x)
    fgdata_y1 = fgdata_y.Column1
    X = DataFrame([fgdata_x1 fgdata_y1], :auto)
    rename!(X, [:x8 => :y])
    formula = "y ~ x1 + x2 + x3+ x4 + x5 + x6 + x7"
    falimy_clsa = "Poisson"
    @test size(X) == (100, 8)
    model = fitglm(X, formula, falimy_clsa)
    A = get_a(model)
    res = coeftest(model, A)
    @test res.pvalue > 0
end
