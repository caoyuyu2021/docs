using TyDeepLearning
using Test

@testset "batchnorm.jl" begin
    @testset "应用批处理规范化" begin
        X = ones(10, 2)
        offset = ones(2)
        scaleFactor = ones(2)
        trainedMu = ones(2)
        trainedSigmaSq = ones(2)
        output = batchnorm(X, offset, scaleFactor, trainedMu, trainedSigmaSq)
        @test size(output) == (10, 2)
    end
end
