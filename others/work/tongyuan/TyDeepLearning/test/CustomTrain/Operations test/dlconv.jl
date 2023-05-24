using TyDeepLearning
using Test

@testset "dlconv.jl" begin
    @testset "执行 2-D 卷积" begin
        X = ones(10, 32, 32, 32)
        Weights = ones(32, 32, 3, 3)
        output = dlconv(X, Weights)
        @test size(output) == (10, 32, 30, 30)
    end
end
