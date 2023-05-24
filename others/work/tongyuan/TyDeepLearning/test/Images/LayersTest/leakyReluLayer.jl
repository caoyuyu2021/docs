using TyDeepLearning
using Test

@testset "leakyReluLayer.jl" begin
    @testset "创建Leaky ReLU层" begin
        layer = leakyReluLayer(0.1)
        @test typeof(layer) <: PyObject
    end
end
