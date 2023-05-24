using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "拟合随机森林分类器模型.jl" begin
    X, y = ty_make_classification()
    clf = randomcforest(X, y)
    X_train, X_test, y_train, y_test = ty_train_test_split(X, y)
    @test size(clf.predict(X_test)) == (400,)
end