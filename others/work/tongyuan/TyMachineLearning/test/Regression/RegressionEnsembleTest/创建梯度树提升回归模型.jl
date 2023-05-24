using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "创建梯度树提升回归模型.jl" begin
    X_reg, y_reg = ty_make_regression()
    X_train_reg, X_test_reg, y_train_reg, y_test_reg = ty_train_test_split(X_reg, y_reg)
    clf_reg = GradientrBoosting(X_reg, y_reg)
    y_pre = clf_reg.predict(X_test_reg)
    @test size(y_pre) == (400,)
end