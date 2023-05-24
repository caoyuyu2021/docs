using TyDeepLearning
using Test

@testset "crossChannelNormalizationLayer.jl" begin
    @testset "创建局部响应归一化层" begin
        layer = crossChannelNormalizationLayer(5, 1.0)
        @test typeof(layer) <: PyObject
    end
end
