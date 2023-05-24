using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "投票分类器.jl" begin
    fgdata_x, fgdata_y1 = get_irsdata()
    fgdata_x1 = Matrix(fgdata_x)
    X = DataFrame([fgdata_x1 fgdata_y1], :auto)
    rename!(X, [:x5 => :y])
    n_estimators = 10
    clf1 = templateKNN(X, n_estimators)
    clf2 = templateSVM(X, n_estimators)
    clf3 = templateNaiveBayes(X, n_estimators)
    estimators = [("knn", clf1), ("svc", clf2), ("nb", clf3)]
    weights = [2, 1, 2]
    X_cls, y_cls = get_irsdata()
    clf_VC = VotingClassifier(X_cls, y_cls, estimators, weights)
    sc = clf_VC.score(X_cls, y_cls)
    @test sc > 0
end