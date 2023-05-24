using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "修改训练轮次.jl" begin
    X, y = ty_make_classification()
    X_train, X_test, y_train, y_test = ty_train_test_split(X, y)
    clf_clas = GradientcBoosting(X_train, y_train)
    clf_add = resume(clf_clas, X_test, y_test, 200)
    sc = clf_add.score(X_test, y_test)
    @test sc > 0
end