using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "查看回归树" begin
    fgdata_x, fgdata_y1 = get_irsdata()
    rtree = fitrtree(fgdata_x, fgdata_y1)
    # view(rtree)
    @test rtree.score(fgdata_x, fgdata_y1) > 0
end
