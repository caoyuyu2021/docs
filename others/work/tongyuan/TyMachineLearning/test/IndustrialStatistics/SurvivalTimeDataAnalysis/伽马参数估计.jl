using Test
using CSV
using DataFrames
using PyCall

@testset "伽马参数估计.jl" begin
    #读取数据集
    c = 1.99
    X = get_stadata(c, 500, "gamma")
    res, rv = TyMachineLearning.gamfit(X, c)
    @test res[3] > 0
end
