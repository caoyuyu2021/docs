using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "投票回归器.jl" begin
    X_reg, y_reg = get_diabetes()
    clf_reg_hist = HistrGradientBoosting(X_reg, y_reg)
    clf_reg = GradientrBoosting(X_reg, y_reg)
    rclf = randomrforest(X_reg, y_reg)
    estimators = [("rf", rclf), ("gtb", clf_reg), ("htgb", clf_reg_hist)]
    clf_VR = VotingRegressor(X_reg, y_reg, estimators)
    sc = clf_VR.score(X_reg, y_reg)
    @test sc > 0
end