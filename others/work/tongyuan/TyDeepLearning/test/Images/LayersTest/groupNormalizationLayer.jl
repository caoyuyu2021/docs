using TyDeepLearning
using Test

@testset "groupNormalizationLayer.jl" begin
    @testset "创建组归一化层" begin
        layer = groupNormalizationLayer(3, 3)
        @test layer.num_groups == 3
        @test layer.num_channels == 3
    end
end
