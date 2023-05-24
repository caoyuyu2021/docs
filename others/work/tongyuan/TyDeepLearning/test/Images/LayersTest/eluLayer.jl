using TyDeepLearning
using Test

@testset "eluLayer.jl" begin
    @testset "创建ELU层" begin
        layer = eluLayer()
        @test typeof(layer) <: PyObject
    end
end
