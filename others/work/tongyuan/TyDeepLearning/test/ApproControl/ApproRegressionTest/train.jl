using TyDeepLearning
using Test

@testset "train.jl" begin
    @testset "训练和绘制网络" begin
        file = dataset_dir("simplefit")
        x, t = simplefit_dataset(file)
        hiddenSizes = 10
        net = fitnet(hiddenSizes)
        net_trained = train(net, x, t; epochs=1, lr=0.05)
        y = TyDeepLearning.predict(net_trained, x)
        error = mse(t, y)
        @test typeof(error) == Float64
    end
end
