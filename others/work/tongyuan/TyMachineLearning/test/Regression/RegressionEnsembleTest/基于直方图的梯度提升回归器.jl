using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "基于直方图的梯度提升回归器.jl" begin
    X_reg, y_reg = get_diabetes()
    clf_reg_hist = HistrGradientBoosting(X_reg, y_reg)
    sc = clf_reg_hist.score(X_reg, y_reg)
    @test sc > 0
end