using TyDeepLearning
using Test

@testset "crop2dLayer.jl" begin
    @testset "创建二维裁剪层" begin
        layer = crop2dLayer(0.5)
        @test typeof(layer) <: PyObject
    end
end
