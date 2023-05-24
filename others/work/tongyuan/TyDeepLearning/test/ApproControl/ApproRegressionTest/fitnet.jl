using TyDeepLearning
using Test
@testset "fitnet.jl" begin
    @testset "构造并训练函数拟合网络" begin
        file = dataset_dir("simplefit")
        x, t = simplefit_dataset(file)
        hiddenSizes = 10
        net = fitnet(hiddenSizes)
        y = TyDeepLearning.predict(net, x)
        @test size(y) == (94, 1)
    end
end
