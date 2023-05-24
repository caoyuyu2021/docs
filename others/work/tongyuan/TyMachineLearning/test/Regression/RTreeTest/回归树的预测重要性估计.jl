using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "回归树的预测重要性估计" begin
    fgdata_x, fgdata_y1 = get_irsdata()
    rtree = fitrtree(fgdata_x, fgdata_y1)
    res = predictorImportance(rtree)
    @test size(res) == (4,)
end