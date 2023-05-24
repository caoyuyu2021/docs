using TyDeepLearning
using Test

@testset "groupedConvolution2dLayer.jl" begin
    @testset "创建分组卷积层" begin
        NumChannelsPerGroup = 3
        NumFiltersPerGroup = 12
        FilterSize = 11
        NumGroups = 3
        layer = groupedConvolution2dLayer(
            NumChannelsPerGroup, NumFiltersPerGroup, FilterSize, NumGroups
        )
        @test layer.stride == (1, 1)
    end
end
