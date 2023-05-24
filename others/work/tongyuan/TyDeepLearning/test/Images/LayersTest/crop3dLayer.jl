using TyDeepLearning
using Test

@testset "crop3dLayer.jl" begin
    @testset "创建三维裁剪层" begin
        layer = crop3dLayer(0.5)
        @test typeof(layer) <: PyObject
    end
end
