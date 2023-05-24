using TyDeepLearning
using Test

@testset "mse.jl" begin
    @testset "MSE 损失函数" begin
        Y = [1 2 3]
        targets = [1 2 2]
        output = mse(Y, targets)
        @test output == 1.0
    end
end
