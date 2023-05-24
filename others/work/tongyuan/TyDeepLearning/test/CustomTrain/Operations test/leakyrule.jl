using TyDeepLearning
using Test

@testset "leakyrelu.jl" begin
    @testset "应用 LeakyReLU 操作" begin
        x = [1 -1 1 -1]
        output = leakyrelu(x)
        @test output == convert(Array{Float32}, [1 -0.2 1 -0.2])
    end
end
