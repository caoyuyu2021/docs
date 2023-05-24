using TyDeepLearning
using Test

@testset "transposedConv2dLayer.jl" begin
    @testset "创建转置卷积层" begin
        NumChannels = 1
        NumFilters = 96
        FilterSize = 11
        layer = transposedConv2dLayer(NumChannels, NumFilters, FilterSize; Stride=4)
        @test layer.stride == (4, 4)
    end
end
