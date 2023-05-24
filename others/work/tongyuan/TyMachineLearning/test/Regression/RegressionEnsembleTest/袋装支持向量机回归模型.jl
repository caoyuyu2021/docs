using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "袋装支持向量机回归模型.jl" begin
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/tree_x.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/tree_y.csv")
    fgdata_x = CSV.read(file1, DataFrame; header=0)
    fgdata_y = CSV.read(file2, DataFrame; header=0)
    fgdata_x1 = Matrix(fgdata_x)
    fgdata_y1 = Array(fgdata_y)
    X = DataFrame([fgdata_x1 fgdata_y1], :auto)
    rename!(X, [:x4 => :y])
    n_estimators = 10
    mdl = SVRbagger(X, n_estimators)
    X_test = Array([[400, 100, 4000], [400, 130, 4000], [400, 150, 4000]])
    res = TyMachineLearning.predict(mdl, X_test)
    x_new, y_new = dropna(X)
    ls = mdl.score(x_new, y_new)
    @test ls > 0
end