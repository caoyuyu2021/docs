using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "高维数据的线性分类模型拟合.jl" begin
    #读取数据集
    X, y = get_irsdata()
    @test size(X) == (150, 4)
    @test size(y) == (150,)
    res = fitclinear(X, y)
    @test res.score(X, y) > 0
end
