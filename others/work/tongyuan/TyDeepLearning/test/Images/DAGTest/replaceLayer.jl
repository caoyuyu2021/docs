using TyDeepLearning
using Test

@testset "replaceLayer.jl" begin
    @testset "从图层中替换层" begin
        layer1 = [
            ("conv1", convolution2dLayer(3, 16, 1)),
            ("BN_1", batchNormalization1dLayer(3)),
            ("relu1", reluLayer()),
            ("fc1", fullyConnectedLayer(10, 3)),
            ("softmax1", softmaxLayer()),
        ]
        net1 = layerGraph(layer1)

        layer2 = [("BN_2", batchNormalization1dLayer(3)), ("leakyRelu1", leakyReluLayer())]
        net2 = layerGraph(layer2)

        newlg = replaceLayer(net1, "net2", net2)
        @test newlg.conv1.kernel_size == (1, 1)
        @test length(keys(newlg.name_cells())) == 5 - 2 + 2
    end
end
