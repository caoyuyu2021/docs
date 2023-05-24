using TyDeepLearning
using Test

@testset "swishLayer.jl" begin
    @testset "创建Swish层" begin
        layer = swishLayer()
        @test typeof(layer) <: PyObject
    end
end
