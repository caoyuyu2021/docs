using TyDeepLearning
using Test

@testset "lgplot.jl" begin
    @testset "绘制图层" begin
        layers = [
            ("conv1", convolution2dLayer(3, 16, 1)),
            ("BN_1", batchNormalization1dLayer(3)),
            ("relu1", reluLayer()),
        ]
        layer = layerGraph(layers)
        @test layer.conv1.kernel_size == (1, 1)
        @test layer.BN_1.num_features == 3
    end
end
