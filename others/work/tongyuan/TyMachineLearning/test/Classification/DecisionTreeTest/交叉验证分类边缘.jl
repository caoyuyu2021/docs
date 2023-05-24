using Test
using TyMachineLearning
using CSV
using DataFrames

@testset "模型函数交叉验证.jl" begin
    # 加载数据集并训练模型
    iris_X, iris_y = get_irsdata()
    mdl = fitcknn(iris_X, iris_y)
    iris = hcat(iris_X, iris_y)
    iris[1:5, :]
    li = kfoldEdge(mdl, iris, 10)
    @test li > 0
end
