using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "在交叉验证回归模型中预测观测响应" begin
    fgdata_x, fgdata_y1 = get_irsdata()
    rtree = fitrtree(fgdata_x, fgdata_y1)
    res = kfoldPredict(rtree, fgdata_x, fgdata_y1, 10)
    @test size(res) == (150,)
end
