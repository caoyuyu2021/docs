using Test
using TyMachineLearning
using CSV
using DataFrames
# using NearestNeighborModels

@testset "训练k-最近邻分类器.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    knn = fitcknn(fgdata_x, fgdata_y1)
    #训练模型
    @test knn.score(fgdata_x, fgdata_y1) > 0
end
