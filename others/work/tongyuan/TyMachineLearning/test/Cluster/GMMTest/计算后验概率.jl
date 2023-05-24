using CSV
using DataFrames
using TyMachineLearning
using Test

@testset "计算后验概率.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    fgm = fitgmdist(fgdata_x; n_components=3)
    p, nlogl = posterior(fgm, fgdata_x)
    @test size(p) == (150, 3)
end
