using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "适合支持向量机或其他分类器的多类模型.jl" begin
    #读取数据集
    X, y = get_irsdata()
    @test size(X) == (150, 4)
    @test size(y) == (150,)
    res = fitcecoc(X, y)
    @test res.score(X, y) > 0
end
