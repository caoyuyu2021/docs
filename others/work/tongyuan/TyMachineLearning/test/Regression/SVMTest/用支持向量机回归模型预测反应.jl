using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "用支持向量机回归模型预测反应" begin
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/flkel_x.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/flkel_y.csv")
    fkdata_x = CSV.read(file1, DataFrame; header=0)
    fkdata_y = CSV.read(file2, DataFrame; header=0)
    X = Array(fkdata_x)
    y = Array(fkdata_y)
    @test size(fkdata_x) == (351, 34)
    @test size(fkdata_y) == (351, 1)
    c = 1.0
    kernel = "linear"
    clf_svm, X1, y1 = fitrsvm(X, y, c, kernel)
    res = TyMachineLearning.predict(clf_svm, X)
    @test size(res) == (351,)
end