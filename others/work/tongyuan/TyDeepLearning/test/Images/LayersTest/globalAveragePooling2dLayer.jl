using TyDeepLearning
using Test

@testset "globalAveragePooling2dLayer.jl" begin
    @testset "创建二维全局平均池化层" begin
        layer = globalAveragePooling2dLayer()
        @test typeof(layer) == PyObject
    end
end
