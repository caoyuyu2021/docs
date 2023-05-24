using TyDeepLearning
using Test

@testset "globalAveragePooling1dLayer.jl" begin
    @testset "创建一维全局平均池化层" begin
        layer = globalAveragePooling1dLayer()
        @test typeof(layer) == PyObject
    end
end
