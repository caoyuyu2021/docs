using TyDeepLearning
using Test

@testset "softmaxLayer.jl" begin
    @testset "创建softmax层" begin
        layer = softmaxLayer()
        @test typeof(layer) == PyObject
    end
end
