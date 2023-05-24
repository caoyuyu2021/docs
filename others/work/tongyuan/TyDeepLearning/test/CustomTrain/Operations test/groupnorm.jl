using TyDeepLearning
using Test

@testset "groupnorm.jl" begin
    @testset "规范化数据" begin
        X = ones(1, 2, 4, 4)
        numGroups = 2
        scaleFactor = ones(2)
        offset = ones(2)
        output = groupnorm(X, numGroups, offset, scaleFactor)
        @test size(output) == (1, 2, 4, 4)
    end
end
