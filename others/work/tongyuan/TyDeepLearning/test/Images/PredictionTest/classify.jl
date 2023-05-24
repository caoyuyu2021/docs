using TyDeepLearning
using Test

@testset "classify.jl" begin
    @testset "使用经过训练的卷积神经网络对图像进行分类" begin
        layer = convolution2dLayer(120, 240, 4)
        array = ones(Float32, (1, 120, 1024, 640))
        @test size(classify(layer, array)) == (1, 240, 1024, 640)
    end
end
