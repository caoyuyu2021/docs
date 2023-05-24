using TyDeepLearning
using Test

@testset "sequenceUnfoldingLayer.jl" begin
    @testset "创建序列展开层" begin
        layer = sequenceUnfoldingLayer((1, 2, 2, 1))
        @test typeof(layer) <: PyObject
    end
end
