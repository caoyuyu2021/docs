using Test
using CSV
using DataFrames
using PyCall

@testset "指数参数估计.jl" begin
    #读取数据集
    c = 0.01
    X = get_stadata(c, 500, "expon")
    res, rv = TyMachineLearning.expfit(X, c)
    @test res[2] > 0
end
