using TyDeepLearning
using Test

@testset "removeLayers.jl" begin
    @testset "从层中删除图层" begin
        layers = [
            ("conv1", convolution2dLayer(3, 16, 1)),
            ("BN_1", batchNormalization1dLayer(3)),
            ("relu1", reluLayer()),
        ]
        net = layerGraph(layers)
        newlg = removeLayers(net, "BN_1")
        @test newlg.conv1.kernel_size == (1, 1)
        @test length(keys(newlg.name_cells())) == 3 - 1
    end
end
