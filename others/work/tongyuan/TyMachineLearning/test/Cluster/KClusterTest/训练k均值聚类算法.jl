using DataFrames
using TyMachineLearning
using Test
using CSV

@testset "训练k均值聚类算法.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    kmdl = kmeans(fgdata_x; n_clusters=3)
    idx = kmdl.labels_
    center = kmdl.cluster_centers_
    @test size(idx) == (150,)
end
