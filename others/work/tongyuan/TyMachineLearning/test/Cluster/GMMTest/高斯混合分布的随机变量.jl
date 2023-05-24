using DataFrames
using TyMachineLearning
using Test
using CSV

@testset "高斯混合分布的随机变量.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    fgm = fitgmdist(fgdata_x; n_components=3)
    x, y = randomgm(fgm, 100)
    @test size(x) == (100, 4)
end
