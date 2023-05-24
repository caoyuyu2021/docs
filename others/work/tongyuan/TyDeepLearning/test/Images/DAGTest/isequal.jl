using TyDeepLearning
using Test

@testset "isequal.jl" begin
    @testset "检查层图是否相等" begin
        layers1 = [
            ("conv1", convolution2dLayer(3, 16, 1)),
            ("BN_1", batchNormalization1dLayer(3)),
            ("relu1", reluLayer()),
        ]
        layers2 = [
            ("conv1", convolution2dLayer(3, 16, 1)),
            ("BN_1", batchNormalization1dLayer(3)),
            ("relu1", reluLayer()),
        ]
        net1 = layerGraph(layers1)
        net2 = layerGraph(layers2)
        @test TyDeepLearning.isequal(net1, net2)
    end
end
