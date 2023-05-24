using TyDeepLearning
using Test

@testset "clippedReluLayer.jl" begin
    @testset "创建Clipped ReLU层" begin
        layer = clippedReluLayer()
        @test typeof(layer) <: PyObject
    end
end
