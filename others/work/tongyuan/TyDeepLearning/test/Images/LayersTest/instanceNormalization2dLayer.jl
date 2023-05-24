using TyDeepLearning
using Test

@testset "instanceNormalization2dLayer.jl" begin
    @testset "创建二维实例归一化层" begin
        layer = instanceNormalization2dLayer(3)
        @test layer.num_features == 3
    end
end
