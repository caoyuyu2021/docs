using Test
using TyMachineLearning
using CSV
using DataFrames
# using DecisionTree

@testset "查看训练的分类树.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    tree = fitctree(fgdata_x, fgdata_y1)
    @test tree.score(fgdata_x, fgdata_y1) > 0
    #TyMachineLearning.view(tree)
end
