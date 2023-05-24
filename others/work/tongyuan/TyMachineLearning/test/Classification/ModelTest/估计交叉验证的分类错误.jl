using Test
using TyMachineLearning
using CSV
using DataFrames
# using DecisionTree

@testset "估计交叉验证的分类错误.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    rtree = fitrtree(fgdata_x, fgdata_y1)
    X = fgdata_x
    y = fgdata_y1
    scorels = "r2"
    cv = 5
    res = crossval(rtree, X, y, cv, scorels)
    @test size(res) == (5,)
end
