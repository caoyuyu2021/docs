using TyDeepLearning
using Test

@testset "addLayers.jl" begin
    @testset "将新的层添加到图层" begin
        layers = [
            ("conv1", convolution2dLayer(3, 16, 1)),
            ("BN_1", batchNormalization1dLayer(3)),
            ("relu1", reluLayer()),
        ]
        net = layerGraph(layers)
        newlg = addLayers(net, [("sigmoid", sigmoidLayer())])
        @test newlg.conv1.kernel_size == (1, 1)
        @test newlg.BN_1.num_features == 3
        @test "sigmoid" in keys(newlg.name_cells())
    end
end
