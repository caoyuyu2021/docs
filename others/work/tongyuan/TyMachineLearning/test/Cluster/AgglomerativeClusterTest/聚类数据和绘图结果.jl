using TyMachineLearning
using DataFrames
using Test
using CSV

@testset "聚类数据和绘图结果.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    fgdata_x1 = Matrix(fgdata_x)
    n = 3 #聚类数
    #训练模型
    mdl, idx = cluster(fgdata_x1, n)
    @test size(idx) == (150,)
end
