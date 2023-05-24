using TyDeepLearning
using Test

@testset "maxPooling1dLayer.jl" begin
    @testset "创建一维最大池化层" begin
        layer = maxPooling1dLayer(3)
        @test layer.kernel_size == (1, 3)
    end
end
