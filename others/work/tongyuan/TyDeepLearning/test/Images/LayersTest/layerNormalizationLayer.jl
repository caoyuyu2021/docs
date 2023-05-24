using TyDeepLearning
using Test

@testset "layerNormalizationLayer.jl" begin
    @testset "创建层归一化层" begin
        layer = layerNormalizationLayer((5, 10, 10))
        @test layer.normalized_shape == (5, 10, 10)
    end
end
