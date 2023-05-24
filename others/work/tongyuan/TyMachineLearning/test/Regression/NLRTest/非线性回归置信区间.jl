using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "非线性回归置信区间" begin
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/ridge_x.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/ridge_y.csv")
    file3 = joinpath(pkgdir(TyMachineLearning), "data/Regression/ridge_k.csv")
    lasdata_x = CSV.read(file1, DataFrame; header=false)
    lasdata_y = CSV.read(file2, DataFrame; header=false)
    lasdata_k = CSV.read(file3, DataFrame; header=false)
    @test size(lasdata_x) == (16, 6)
    @test size(lasdata_y) == (16, 1)
    # @test size(lasdata_k) == (20,)
    fgdata_x1 = Matrix(lasdata_x)
    fgdata_y1 = Array(lasdata_y)
    X = DataFrame([fgdata_x1 fgdata_y1], :auto)
    rename!(X, [:x7 => :y])
    # formula = "y ~ x1 + x2 + x3+ x4 + x5 + x6 + x7"
    falimy_clsa = "Ridge"
    mdl, x, y = get_nlmodel(X, falimy_clsa)
    res = nlpredci(mdl, X, 0.95, 10)
    @test size(res) == (7,)
end
