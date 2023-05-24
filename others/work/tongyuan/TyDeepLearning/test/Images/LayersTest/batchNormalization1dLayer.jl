using TyDeepLearning
using Test

@testset "batchNormalization1dLayer.jl" begin
    @testset "创建一维批量归一化图层" begin
        layer = batchNormalization1dLayer(3)
        @test layer.num_features == 3
    end
end
