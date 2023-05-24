using TyDeepLearning
using Test

@testset "dropoutLayer.jl" begin
    @testset "创建Dropout层" begin
        layer = dropoutLayer(0.5)
        @test layer.probability == 0.5
    end
end
