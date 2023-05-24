using Test
using CSV
using TyMachineLearning
using DataFrames

@testset "特征提取" begin
    X, y = get_irsdata()
    L = TyMachineLearning.transform(X)
    @test size(L) == (4, 4)
end
