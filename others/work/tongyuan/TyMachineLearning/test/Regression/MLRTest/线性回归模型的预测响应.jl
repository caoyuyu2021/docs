using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "线性回归模型的预测响应.jl" begin
    #数据集
    X_reg, y_reg = get_diabetes()
    clf_reg_hist = HistrGradientBoosting(X_reg, y_reg)
    M = TyMachineLearning.feval(clf_reg_hist, X_reg, X_reg)
    @test size(M) == (2, 442)
end
