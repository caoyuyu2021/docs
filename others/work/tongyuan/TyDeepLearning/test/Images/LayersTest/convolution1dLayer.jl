using TyDeepLearning
using Test

@testset "convolution1dLayer.jl" begin
    @testset "创建一维卷积层" begin
        NumChannels = 1
        NumFilters = 96
        FilterSize = 11
        layer = convolution1dLayer(NumChannels, NumFilters, FilterSize; Stride=4)
        @test layer.stride == (1, 4)
    end
end
