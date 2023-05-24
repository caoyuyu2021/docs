using TyDeepLearning
using Test

@testset "sigmoidLayer.jl" begin
    @testset "创建Sigmoid层" begin
        layer = sigmoidLayer()
        @test typeof(layer) == PyObject
    end
end
