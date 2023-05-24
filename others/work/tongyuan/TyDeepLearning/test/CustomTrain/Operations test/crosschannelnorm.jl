using TyDeepLearning
using Test

@testset "crosschannelnorm.jl" begin
    @testset "使用相邻通道的值规范化数据" begin
        X = ones(1, 1, 10, 2)
        output = crosschannelnorm(X)
        @test size(output) == (1, 1, 10, 2)
    end
end
