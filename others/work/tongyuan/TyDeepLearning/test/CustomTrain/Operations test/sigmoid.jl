using TyDeepLearning
using Test

@testset "sigmoid.jl" begin
    @testset "应用 Sigmiod激活" begin
        X = [1 2 3 4]
        output = sigmoid(X)
        @test size(output) == (1, 4)
    end
end
