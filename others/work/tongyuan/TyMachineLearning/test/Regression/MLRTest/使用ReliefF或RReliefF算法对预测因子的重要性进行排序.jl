using Test
using TyMachineLearning
using CSV
using DataFrames

@testset "使用ReliefF或RReliefF算法对预测因子的重要性进行排序.jl" begin
    # 加载数据集并训练模型
    iris_X, iris_y = get_irsdata()
    index, weights = relieff(iris_X, iris_y)
    @test size(index) == (4,)
end