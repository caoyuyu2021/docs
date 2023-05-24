using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "拟合梯度树提升分类模型.jl" begin
    X, y = ty_make_classification()
    X_train, X_test, y_train, y_test = ty_train_test_split(X, y)
    clf_clas = GradientcBoosting(X_train, y_train)
    sc = clf_clas.score(X_test, y_test)
    @test sc > 0
end