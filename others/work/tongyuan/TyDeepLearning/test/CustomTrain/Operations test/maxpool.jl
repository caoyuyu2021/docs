using TyDeepLearning
using Test

@testset "maxpool.jl" begin
    @testset "执行二维最大池化" begin
        X = ones(1, 3, 3, 4)
        poolsize = 2
        output = maxpool(X, poolsize)
        @test size(output) == (1, 3, 2, 3)
    end
end
