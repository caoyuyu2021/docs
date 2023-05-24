using Test
using TyMachineLearning
using CSV
using DataFrames
# using NearestNeighborModels

@testset "使用k-最近邻分类器预测标签.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    knn = fitcknn(fgdata_x, fgdata_y1)
    @test length(TyMachineLearning.predict(knn, fgdata_x)) == size(fgdata_x, 1)
end
