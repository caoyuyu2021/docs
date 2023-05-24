using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "基于直方图的梯度提升.jl" begin
    fgdata_x, fgdata_y1 = get_irsdata()
    clf_hist = HistcGradientBoosting(fgdata_x, fgdata_y1)
    sc = clf_hist.score(fgdata_x, fgdata_y1)
    @test sc > 0
end