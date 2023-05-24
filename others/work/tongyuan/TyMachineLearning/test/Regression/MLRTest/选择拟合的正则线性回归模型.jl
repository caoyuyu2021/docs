using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "选择拟合的正则线性回归模型.jl" begin
    X, y, clf = Mdl_SM()
    @test size(X) == (442, 10)
    @test size(y) == (442,)
    idx = 2
    model = clf
    res = selectModels(model, idx)
    # @test res.get_support
end
