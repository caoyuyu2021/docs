using TyMachineLearning
using CSV
using DataFrames
using Test

@testset "绘制用于分类的ROC曲线.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Classification/iris.csv")
    iris = CSV.read(file, DataFrame; header=false)
    @test size(iris) == (150, 5)
    #划分数据集
    X = iris[51:2:end, 1:4]
    y = iris[51:2:end, 5]
    X_test = iris[52:2:end, 1:4]
    y_test = iris[52:2:end, 5]
    #训练模型
    clf = fitclinear(X, y)
    X1 = Array(X_test)
    y_pred = TyMachineLearning.predict(clf, X1)
    @test size(y_pred) == (50,)
    #计算接收机工作特性
    fpr, tpr, thresholds = perfcurve(y_test, y_pred)
    @test size(fpr) == size(tpr) == size(thresholds)
    #绘制ROC曲线
    #plot(fpr, tpr)
end
