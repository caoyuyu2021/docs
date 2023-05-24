using DataFrames
using TyMachineLearning
using Test
using CSV

@testset "对输入数据执行谱聚类.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    fgdata_x1 = Matrix(fgdata_x)
    n = 3 #聚类数
    #执行谱聚类
    mdl, idx = spectralcluster(fgdata_x1, n)
    @test length(idx) == size(fgdata_x1, 1)
end
