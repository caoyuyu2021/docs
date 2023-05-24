using TyDeepLearning
using Test

@testset "patternnet.jl" begin
    @testset "构造并训练模式识别神经网络" begin
        file1 = joinpath(dataset_dir("iris"), "irisInputs.csv")
        file2 = joinpath(dataset_dir("iris"), "irisTargets.csv")
        x = CSV.read(file1, DataFrame; header=false)
        t = CSV.read(file2, DataFrame; header=false)
        x = Array(x)
        t = Array(t)
        t = reshape(t, size(t, 1))
        hiddenSizes = 10
        net = patternnet(hiddenSizes, 4, 3)
        y = TyDeepLearning.predict(net, x)
        @test size(y) == (150, 3)
    end
end
