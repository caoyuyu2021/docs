using TyDeepLearning
using Test

@testset "averagePooling2dLayer.jl" begin
    @testset "创建二维平均池化层" begin
        layer = averagePooling2dLayer(3)
        @test layer.kernel_size == 3
    end
end
