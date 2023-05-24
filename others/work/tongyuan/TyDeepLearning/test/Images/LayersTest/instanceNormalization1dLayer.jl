using TyDeepLearning
using Test

@testset "instanceNormalization1dLayer.jl" begin
    @testset "创建一维实例归一化层" begin
        layer = instanceNormalization1dLayer(3)
        @test layer.num_features == 3
    end
end
