using TyDeepLearning
using Test

@testset "instanceNormalization3dLayer.jl" begin
    @testset "创建三维实例归一化层" begin
        layer = instanceNormalization3dLayer(3)
        @test layer.num_features == 3
    end
end
