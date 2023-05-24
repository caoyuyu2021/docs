using TyDeepLearning
using Test

@testset "globalMaxPooling2dLayer.jl" begin
    @testset "创建二维全局最大池化层" begin
        layer = globalMaxPooling2dLayer()
        @test typeof(layer) == PyObject
    end
end
