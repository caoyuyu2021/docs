using TyDeepLearning
using Test

@testset "dltranspconv.jl" begin
    @testset "执行 2-D 转置卷积" begin
        X = ones(10, 32, 30, 30)
        Weights = ones(32, 32, 3, 3)
        output = dltranspconv(X, Weights)
        @test size(output) == (10, 32, 32, 32)
    end
end
