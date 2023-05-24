using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "计算部分相关性" begin
    #读取数据集
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
    clf, X1, y1 = fitrsvm(X, y, c, kernel)
    #partialDependence(clf, X1, [3, 4, 5, 10, 11, 13, 15, 19, 20])
    @test clf.score(X1, y1) > 0
end
