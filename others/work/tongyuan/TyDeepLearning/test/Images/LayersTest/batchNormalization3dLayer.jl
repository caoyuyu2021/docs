using TyDeepLearning
using Test

@testset "batchNormalization3dLayer.jl" begin
    @testset "创建三维批量归一化图层" begin
        layer = batchNormalization3dLayer(3)
        @test typeof(layer) <: PyObject
    end
end
