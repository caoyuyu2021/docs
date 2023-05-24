using TyDeepLearning
using Test

@testset "reluLayer.jl" begin
    @testset "创建ReLU层" begin
        layer = reluLayer()
        @test typeof(layer) <: PyObject
    end
end
