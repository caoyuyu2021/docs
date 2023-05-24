using DataFrames
using CSV
using TyMachineLearning
using Test

@testset "稳健的多元协方差和均值估计.jl" begin
    X = get_robustcovdata()
    cov, sig, mah, outliers = robustcov(X)
    @test size(sig) == (2, 2)
end
