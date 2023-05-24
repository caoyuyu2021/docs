using TyDeepLearning
using Test

@testset "tanhLayer.jl" begin
    @testset "创建双曲切线层" begin
        layer = tanhLayer()
        @test typeof(layer) <: PyObject
    end
end
