using Test
using CSV
using DataFrames
using PyCall

@testset "极值参数估计.jl" begin
    #读取数据集
    c = -0.1
    X = get_stadata(c, 500, "genextreme")
    res, rv = TyMachineLearning.evfit(X, c)
    @test res[3] > 0
end
