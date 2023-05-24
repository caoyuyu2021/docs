using TyDeepLearning
using Test

@testset "averagePooling3dLayer.jl" begin
    @testset "创建三维平均池化层" begin
        layer = averagePooling3dLayer(3)
        @test typeof(layer) == PyObject
    end
end
