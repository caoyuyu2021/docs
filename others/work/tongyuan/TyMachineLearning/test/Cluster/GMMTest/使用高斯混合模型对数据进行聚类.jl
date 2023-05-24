using CSV
using DataFrames
using TyMachineLearning
using Test

@testset "使用高斯混合模型对数据进行聚类.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    fgm = fitgmdist(fgdata_x; n_components=3)
    @test fgm.aic(fgdata_x) > 0
end
