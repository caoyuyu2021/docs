using TyDeepLearning
using Test

@testset "avgpool.jl" begin
    @testset "执行二维平均池化" begin
        X = ones(1, 3, 3, 4)
        poolsize = 2
        output = avgpool(X, poolsize)
        @test size(output) == (1, 3, 2, 3)
    end
end
