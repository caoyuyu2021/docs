using TyDeepLearning
using Test

@testset "softmax.jl" begin
    @testset "应用 Softmax激活" begin
        x = [1 2 3 4]
        output = softmax(x)
        @test size(output) == (1, 4)
    end
end
