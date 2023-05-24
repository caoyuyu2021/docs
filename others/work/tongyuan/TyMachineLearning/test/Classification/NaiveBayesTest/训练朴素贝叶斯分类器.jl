using Test
using TyMachineLearning
using CSV
using DataFrames
# using NaiveBayes

@testset "训练朴素贝叶斯分类器.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    #训练模型
    mdl = fitcnb(fgdata_x, fgdata_y1)
    @test mdl.score(fgdata_x, fgdata_y1) > 0
end