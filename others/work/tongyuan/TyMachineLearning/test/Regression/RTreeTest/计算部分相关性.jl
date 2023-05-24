using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "计算部分相关性" begin
    fgdata_x, fgdata_y1 = get_irsdata()
    rtree = fitrtree(fgdata_x, fgdata_y1)
    # partialDependence(rtree, fgdata_x, [0, 1, 2])
    @test rtree.score(fgdata_x, fgdata_y1) > 0
end
