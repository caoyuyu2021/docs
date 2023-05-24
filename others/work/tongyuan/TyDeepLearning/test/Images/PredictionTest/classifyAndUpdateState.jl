using TyDeepLearning
using Test

@testset "classifyAndUpdateState.jl" begin
    @testset "分类和更新网络状态" begin
        layer = convolution2dLayer(120, 240, 4)
        array = ones(Float32, (1, 120, 1024, 640))
        net, output = classifyAndUpdateState(layer, array)
        @test size(output) == (1, 240, 1024, 640)
    end
end
