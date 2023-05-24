using TyDeepLearning
using Test

@testset "layerGraph.jl" begin
    @testset "从图层数组创建图层" begin
        layers = [
            ("conv1", convolution2dLayer(3, 16, 1)),
            ("BN_1", batchNormalization1dLayer(3)),
            ("relu1", reluLayer()),
        ]
        layer = layerGraph(layers)
        @test layer.conv1.kernel_size == (1, 1)
        @test layer.BN_1.num_features == 3
    end

    @testset "创建简单的 DAG 网络" begin
        layers = [
            ("conv1", convolution2dLayer(3, 16, 1)),
            ("BN_1", batchNormalization1dLayer(3)),
            ("relu1", reluLayer()),
            ("conv2", convolution2dLayer(3, 32, 2)),
            ("BN_2", batchNormalization1dLayer(2)),
            ("relu2", reluLayer()),
            ("conv3", convolution2dLayer(3, 32, 3)),
            ("BN_3", batchNormalization1dLayer(1)),
            ("relu3", reluLayer()),
        ]
        layer = layerGraph(layers)
        @test layer.conv1.kernel_size == (1, 1)
        @test layer.BN_1.num_features == 3
        @test layer.conv2.kernel_size == (2, 2)
        @test layer.BN_2.num_features == 2
        @test layer.conv3.kernel_size == (3, 3)
        @test layer.BN_3.num_features == 1
    end
end
