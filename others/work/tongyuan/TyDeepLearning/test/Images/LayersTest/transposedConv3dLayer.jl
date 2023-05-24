using TyDeepLearning
using Test

@testset "transposedConv3dLayer.jl" begin
    @testset "创建转置3-D卷积层" begin
        NumChannels = 1
        NumFilters = 32
        FilterSize = 7 #卷积核尺寸最大为7
        layer = transposedConv3dLayer(NumChannels, NumFilters, FilterSize; Stride=(4, 4, 2))
        @test layer.stride == (4, 4, 2)
    end
end
