using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "使用回归树预测响应" begin
    fgdata_x, fgdata_y1 = get_irsdata()
    rtree = fitrtree(fgdata_x, fgdata_y1)
    res = TyMachineLearning.predict(rtree, fgdata_x)
    @test size(res) == (150,)
end
