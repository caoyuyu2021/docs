using TyDeepLearning
using Test

@testset "lstmLayer.jl" begin
    @testset "创建LSTM层" begin
        layer = lstmLayer(1, 100)
        @test typeof(layer) <: PyObject
    end

    @testset "用于序列分类的训练网络" begin
        layer = lstmLayer(12, 100; NumLayers=9)
        @test typeof(layer) <: PyObject
    end

    @testset "用LSTM作分类" begin
        layer = lstmLayer(12, 100; NumLayers=9)
        @test typeof(layer) <: PyObject
    end

    @testset "用LSTM作回归" begin
        layer = lstmLayer(12, 125; NumLayers=1)
        @test typeof(layer) <: PyObject
    end

    @testset "深度LSTM网络" begin
        layer = lstmLayer(12, 125; NumLayers=9)
        @test typeof(layer) <: PyObject
    end
end
