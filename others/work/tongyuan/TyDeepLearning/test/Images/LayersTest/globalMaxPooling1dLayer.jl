using TyDeepLearning
using Test

@testset "globalMaxPooling1dLayer.jl" begin
    @testset "创建一维全局最大池化层" begin
        layer = globalMaxPooling1dLayer()
        @test typeof(layer) == PyObject
    end
end
