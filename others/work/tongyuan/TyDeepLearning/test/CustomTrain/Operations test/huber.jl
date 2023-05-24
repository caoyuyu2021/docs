using TyDeepLearning
using Test

@testset "huber.jl" begin
    @testset "Huber 损失函数" begin
        Y = [1 2 3]
        targets = [1 2 2]
        output = huber(Y, targets)
        @test output == [0.0 0.0 0.5]
    end
end
