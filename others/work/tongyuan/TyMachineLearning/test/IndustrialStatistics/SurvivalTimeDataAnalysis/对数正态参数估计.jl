using Test
using CSV
using DataFrames
using PyCall

@testset "对数正态参数估计.jl" begin
    #读取数据集
    c = 0.954
    X = get_stadata(c, 500, "lognorm")
    res, rv = TyMachineLearning.lognfit(X, c)
    @test res[3] > 0
end
