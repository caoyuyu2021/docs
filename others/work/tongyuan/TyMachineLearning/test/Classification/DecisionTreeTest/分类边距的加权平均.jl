using Test
using TyMachineLearning
using CSV
using DataFrames

@testset "分类边距的加权平均.jl" begin
    # 加载数据集并训练模型
    iris_X, iris_y = get_irsdata()
    meas = iris_X[:, 1:2]
    # 计算前两列 margins 和 edge
    mdl = fitctree(meas, iris_y)
    margins = TyMachineLearning.margin(mdl, meas, iris_y)[(end - 10):end]
    e = edge(mdl, meas, iris_y)
    @test e > 0
end
