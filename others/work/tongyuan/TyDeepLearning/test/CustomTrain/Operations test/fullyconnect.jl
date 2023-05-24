using TyDeepLearning
using Test

@testset "fullyconnect.jl" begin
    @testset "将所有输入数据完全连接到输出要素" begin
        batch_size = 12
        in_channel = 10
        out_channel = 20
        X = rand(batch_size, in_channel)
        Weights = rand(out_channel, in_channel)
        Bias = rand(out_channel)
        output = fullyconnect(X, Weights, Bias)
        @test size(output) == (12, 20)
    end
end
