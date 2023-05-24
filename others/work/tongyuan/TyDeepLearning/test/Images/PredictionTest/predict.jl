using TyDeepLearning
using Test

@testset "predict.jl" begin
    @testset "使用经过训练的卷积神经网络预测数值响应" begin
        layer = convolution2dLayer(120, 240, 4)
        array = ones(Float32, (1, 120, 1024, 640))
        @test size(TyDeepLearning.predict(layer, array)) == (1, 240, 1024, 640)
    end
end
