using TyDeepLearning
using Test

@testset "averagePooling1dLayer.jl" begin
    @testset "创建一维平均池化层" begin
        layer = averagePooling1dLayer(3)
        @test layer.kernel_size == (1, 3)
    end
end
