using Test
using CSV
using DataFrames
using PyCall

@testset "威布尔参数估计.jl" begin
    X, a, b = get_wbldata(200)
    res, rv = TyMachineLearning.wblfit(X, a, b)
    @test res[3] > 0
end
