using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "拟合随机森林回归器模型.jl" begin
    X_reg, y_reg = ty_make_regression()
    rclf = randomrforest(X_reg, y_reg)
    y_pre = rclf.predict(X_reg)
    @test size(y_pre) == (1000,)
end