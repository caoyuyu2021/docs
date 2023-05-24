using Test
using TyMachineLearning
using CSV
using DataFrames
# using DecisionTree

@testset "生成分类树.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    #训练模型
    tree = fitctree(fgdata_x, fgdata_y1)
    @test tree.score(fgdata_x, fgdata_y1) > 0
end
