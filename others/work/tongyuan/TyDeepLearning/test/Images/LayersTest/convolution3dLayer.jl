using TyDeepLearning
using Test

@testset "convolution3dLayer.jl" begin
    @testset "创建3-D卷积层" begin
        NumChannels = 1
        NumFilters = 32
        FilterSize = 5
        layer = convolution3dLayer(NumChannels, NumFilters, FilterSize; Stride=1)
        @test layer.stride == (1, 1, 1)
    end

    @testset "在3-D卷积层中指定初始权重和偏差" begin
        NumChannels = 1
        NumFilters = 32
        FilterSize = 5
        layer = convolution3dLayer(
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

    @testset "创建完全覆盖三维输入的卷积层" begin
        NumChannels = 1
        NumFilters = 16
        FilterSize = (6, 4, 5)
        layer = convolution3dLayer(
            NumChannels,
            NumFilters,
            FilterSize;
            Stride=4,
            PaddingMode="pad",
            PaddingSize=(1, 0, 0, 1, 0, 1),
        )
        @test layer.stride == (4, 4, 4)
    end
end
