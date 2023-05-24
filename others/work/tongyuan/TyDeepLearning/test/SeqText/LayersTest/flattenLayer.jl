using TyDeepLearning
using Test

@testset "flattenLayer.jl" begin
    @testset "创建Flatten层" begin
        layer = flattenLayer()
        @test typeof(layer) <: PyObject
    end
end
