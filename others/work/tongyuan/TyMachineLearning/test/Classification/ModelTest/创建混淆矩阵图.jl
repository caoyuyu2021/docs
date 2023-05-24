using TyMachineLearning
using CSV
using DataFrames
using Test
using TyPlot

@testset "创建混淆矩阵图.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Classification/iris.csv")
    iris = CSV.read(file, DataFrame; header=false)
    @test size(iris) == (150, 5)
    #划分数据集
    X = iris[:, 1:4]
    y = iris[:, 5]
    #训练模型
    clf = fitclinear(X, y)
    X1 = Array(X)
    y_pred = TyMachineLearning.predict(clf, X1)
    @test size(y_pred) == (150,)
    #绘制混淆矩阵图
    #confusionchart(y, y_pred)
end
