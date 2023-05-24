using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "回归拟合二叉决策树" begin
    fgdata_x, fgdata_y1 = get_irsdata()
    rtree = fitrtree(fgdata_x, fgdata_y1)
    @test rtree.score(fgdata_x, fgdata_y1) > 0
end
