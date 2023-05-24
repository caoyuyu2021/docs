using Test
using TyMachineLearning
using CSV
# using DecisionTree
using DataFrames

@testset "计算和绘制对一个变量的部分相关性.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    #训练模型
    ClassificationMdl = fitctree(fgdata_x, fgdata_y1)
    pd, x = partialDependence(ClassificationMdl, fgdata_x, [1])
    @test size(x[1]) == (23,)
end
