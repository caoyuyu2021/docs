using TyDeepLearning
using Test

@testset "confusionchart.jl" begin
    @testset "计算混淆矩阵" begin
        x = [1 0 1 0]
        y = [1 0 0 1]
        output = confusionchart(x, y)
        @test output == [1.0 1.0; 1.0 1.0]
    end
end
