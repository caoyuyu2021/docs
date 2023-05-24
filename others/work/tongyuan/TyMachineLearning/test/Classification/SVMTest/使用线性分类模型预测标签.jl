using Test
using TyMachineLearning
using CSV
using DataFrames

@testset "使用线性分类模型预测标签.jl" begin
    #读取数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Classification/iris.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Classification/irisXnew.csv")
    iris = CSV.read(file1, DataFrame; header=false)
    Xnew = CSV.read(file2, DataFrame; header=false)
    @test size(Xnew) == (75, 4)
    @test size(iris) == (150, 5)
    #划分数据集
    X = iris[1:2:end, 1:4]
    y = iris[1:2:end, 5]
    #训练模型
    mdl = fitclinear(X, y)
    X1 = Array(Xnew)
    @test length(TyMachineLearning.predict(mdl, X1)) == size(X1, 1)
end
