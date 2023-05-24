using TyDeepLearning
using Test

@testset "bilstmLayer.jl" begin
    @testset "创建双向LSTM层" begin
        layer = bilstmLayer(12, 100; NumLayers=9)
        @test typeof(layer) <: PyObject
    end
end
