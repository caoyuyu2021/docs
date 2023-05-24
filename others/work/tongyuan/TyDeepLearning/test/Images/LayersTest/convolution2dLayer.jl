using TyDeepLearning
using Test

@testset "convolution2dLayer.jl" begin
    @testset "创建二维卷积层" begin
        NumChannels = 1
        NumFilters = 96
        FilterSize = 11
        layer = convolution2dLayer(NumChannels, NumFilters, FilterSize; Stride=4)
        @test layer.stride == (4, 4)
    end

    @testset "在卷积层中指定初始权重和偏差" begin
        NumChannels = 1
        NumFilters = 32
        FilterSize = 5
        layer = convolution2dLayer(
            NumChannels,
            NumFilters,
            FilterSize;
            Stride=1,
            WeightsInitializer="HeUniform",
            BiasInitializer="One",
        )
        @test layer.bias_init == "One"
        @test layer.weight_init == "HeUniform"
    end

    @testset "创建完全覆盖输入的卷积层" begin
        NumChannels = 1
        NumFilters = 16
        FilterSize = (6, 4)
        layer = convolution2dLayer(
            NumChannels,
            NumFilters,
            FilterSize;
            Stride=4,
            PaddingMode="pad",
            PaddingSize=(1, 1, 0, 0),
        )
        @test layer.stride == (4, 4)
    end
end
