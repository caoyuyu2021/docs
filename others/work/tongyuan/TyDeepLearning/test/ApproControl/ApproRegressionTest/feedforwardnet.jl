using TyDeepLearning
using Test

@testset "feedforwardnet.jl" begin
    @testset "构造和训练前馈神经网络" begin
        file = dataset_dir("simplefit")
        x, t = simplefit_dataset(file)
        hiddenSizes = 10
        net = feedforwardnet(hiddenSizes)
        y = TyDeepLearning.predict(net, x)
        @test size(y) == (94, 1)
    end
end
