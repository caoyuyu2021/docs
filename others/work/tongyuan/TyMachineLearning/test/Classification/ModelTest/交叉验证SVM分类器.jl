using Test
using TyMachineLearning
using CSV
using DataFrames

@testset "交叉验证SVM分类器.jl" begin
    #读取数据集
    X, y = get_irsdata()
    c = 1.0
    kernel = "linear"
    clf, X1, y1 = fitrsvm(X, y, c, kernel)
    @test size(X) == (150, 4)
    @test size(y) == (150,)
    scorels = "f1_macro"
    cv = 5
    res = crossval(clf, X, y, cv, scorels)
    @test res[1] > 0
end
