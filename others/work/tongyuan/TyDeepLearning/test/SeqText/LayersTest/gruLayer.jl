using TyDeepLearning
using Test

@testset "gruLayer.jl" begin
    @testset "创建GRU层" begin
        layer = gruLayer(12, 100; NumLayers=9)
        @test typeof(layer) <: PyObject
    end
end
