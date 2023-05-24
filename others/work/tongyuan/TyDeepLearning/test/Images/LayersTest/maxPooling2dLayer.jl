using TyDeepLearning
using Test

@testset "maxPooling2dLayer.jl" begin
    @testset "创建二维最大池化层" begin
        layer = maxPooling2dLayer(3)
        @test layer.kernel_size == 3
    end
end
