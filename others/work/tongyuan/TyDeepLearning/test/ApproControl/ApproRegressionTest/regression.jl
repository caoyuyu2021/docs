using TyDeepLearning
using Test

@testset "regression.jl" begin
    @testset "拟合回归模型" begin
        file = dataset_dir("simplefit")
        x, t = simplefit_dataset(file)
        hiddenSizes = 10
        net = feedforwardnet(hiddenSizes)
        net_trained = train(net, x, t; epochs=1, lr=0.05)
        y = TyDeepLearning.predict(net_trained, x)
        t = reshape(t, 94)
        y = reshape(y, 94)
        r, m, b = regression(t, y)
        @test typeof(r) <: Float64
    end
end