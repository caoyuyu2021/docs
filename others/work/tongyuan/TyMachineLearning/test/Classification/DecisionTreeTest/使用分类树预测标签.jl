using Test
using TyMachineLearning
using CSV
using DataFrames
# using DecisionTree

@testset "使用分类树预测标签.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    #训练模型
    tree = fitctree(fgdata_x, fgdata_y1)
    @test length(TyMachineLearning.predict(tree, fgdata_x)) == size(fgdata_x, 1)
end
