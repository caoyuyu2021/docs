using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "多项逻辑回归值.jl" begin
    X, y = get_irsdata()
    mdl = fitclinear(X, y)
    @test size(X) == (150, 4)
    @test size(y) == (150,)
    res = mnrval(mdl, X, y)
    @test res > 0
end
