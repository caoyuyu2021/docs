using TyDeepLearning
using Test

@testset "resetState.jl" begin
    @testset "重置网络状态" begin
        file1 = joinpath(dataset_dir("iris"), "irisInputs.csv")
        file2 = joinpath(dataset_dir("iris"), "irisTargets.csv")
        x = CSV.read(file1, DataFrame; header=false)
        t = CSV.read(file2, DataFrame; header=false)
        x = Array(x)
        t = Array(t)
        t = reshape(t, size(t, 1))
        hiddenSizes = 10
        net = patternnet(hiddenSizes, 4, 3)
        net = train(net, x, t; epochs=5, lr=0.001, loss_fun="CrossEntropyLoss")
        net = resetState(net)
        y = TyDeepLearning.predict(net, x)
        @test size(y) == (150, 3)
    end
end
