using TyDeepLearning
using Test

@testset "globalMaxPooling3dLayer.jl" begin
    @testset "创建三维全局最大池化层" begin
        layer = globalMaxPooling3dLayer()
        @test typeof(layer) == PyObject
    end
end
