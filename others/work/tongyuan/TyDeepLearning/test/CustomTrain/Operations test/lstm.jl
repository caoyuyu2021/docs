using TyDeepLearning
using Test

@testset "lstm.jl" begin
    @testset "将 LSTM 操作应用于序列数据" begin
        input_size = 10
        hidden_size = 2
        num_layers = 1
        seq_len = 5
        batch_size = 2
        X = ones(seq_len, batch_size, input_size)
        H0 = ones(num_layers, batch_size, hidden_size)
        C0 = ones(num_layers, batch_size, hidden_size)
        Weights = ones(112, 1, 1)
        output = lstm(X, H0, C0, Weights)
        @test size(output) == (5, 2, 2)
    end
end
