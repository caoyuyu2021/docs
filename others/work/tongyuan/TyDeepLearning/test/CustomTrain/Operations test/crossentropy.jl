using TyDeepLearning
using Test

@testset "crossentropy.jl" begin
    @testset "单标签分类的交叉熵损失" begin
        X = randn(Float32, (3, 5))
        labels = [1, 0, 4]
        weights = [1, 1, 1]
        output = TyDeepLearning.crossentropy(X, labels, weights)
        @test output .>= 0
    end
end
