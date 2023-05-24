using TyDeepLearning
using Test

@testset "maxPooling3dLayer.jl" begin
    @testset "创建三维最大池化层" begin
        layer = maxPooling3dLayer(3)
        @test typeof(layer) == PyObject
    end
end
