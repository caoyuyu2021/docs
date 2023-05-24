using TyDeepLearning
using PyCall
using Test

@testset "fullyConnectedLayer.jl" begin
    @testset "创建完全连接的层" begin
        InputSize = 1
        OutputSize = 10
        layer = fullyConnectedLayer(InputSize, OutputSize)
        @test typeof(layer) <: PyObject
    end

    @testset "在完全连接的图层中指定初始权重和偏移" begin
        InputSize = 1
        OutputSize = 10
        layer = fullyConnectedLayer(InputSize, OutputSize; WeightsInitializer="HeUniform")
        @test typeof(layer) <: PyObject
    end
end
