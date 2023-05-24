using TyDeepLearning
using Test

@testset "ploterrhist.jl" begin
    @testset "绘制误差值直方图" begin
        file = dataset_dir("simplefit")
        x, t = simplefit_dataset(file)
        hiddenSizes = 10
        net = feedforwardnet(hiddenSizes)
        net_trained = train(net, x, t; epochs=50, lr=0.05)
        y = TyDeepLearning.predict(net_trained, x)
        error = t - y
        bins = 30
        ploterrhist(error, 30)
        @test typeof(error) <: Matrix{Float64}
    end
end
