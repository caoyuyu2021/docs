using Test
using CSV
using DataFrames
using PyCall

@testset "正态参数估计.jl" begin
    #读取数据集
    c = 0.954
    X = get_stadata(c, 500, "norm")
    res, rv = TyMachineLearning.normfit(X, c)
    @test res[2] > 0
end
