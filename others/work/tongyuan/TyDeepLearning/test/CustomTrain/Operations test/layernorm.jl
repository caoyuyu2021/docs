using TyDeepLearning
using Test

@testset "layernorm.jl" begin
    @testset "应用层规范化" begin
        X = ones(10, 3)
        scaleFactor = ones(3)
        offset = ones(3)
        output = layernorm(X, offset, scaleFactor)
        @test size(output) == (10, 3)
    end
end
