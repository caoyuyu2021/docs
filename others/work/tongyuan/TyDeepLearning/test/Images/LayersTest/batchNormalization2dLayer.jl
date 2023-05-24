using TyDeepLearning
using Test

@testset "batchNormalization2dLayer.jl" begin
    @testset "创建二维批量归一化图层" begin
        layer = batchNormalization2dLayer(3)
        @test layer.num_features == 3
    end
end
