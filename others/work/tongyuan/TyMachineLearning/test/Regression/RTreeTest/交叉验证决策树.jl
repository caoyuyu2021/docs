using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "交叉验证决策树" begin
    fgdata_x, fgdata_y1 = get_irsdata()
    rtree = fitrtree(fgdata_x, fgdata_y1)
    X = fgdata_x
    y = fgdata_y1
    scorels = "r2"
    cv = 5
    res = crossval(rtree, X, y, cv, scorels)
    @test size(res) == (5,)
end