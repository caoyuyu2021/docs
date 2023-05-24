using TyDeepLearning
using Test

@testset "relu.jl" begin
    @testset "应用 ReLU 操作" begin
        x = [1 -1 1 -1]
        output = relu(x)
        @test output == [1 0 1 0]
    end
end
