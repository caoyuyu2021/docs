using DataFrames
using CSV
using TyMachineLearning
using Test

@testset "t分布随机邻居嵌入.jl" begin
    X = get_digits()
    ts = tsne(; perplexity=30, init="pca", n_iter=1000, learning_rate="auto")
    transformed = ts.fit_transform(X[1:100, :])
    @test size(transformed) == (100, 2)
end
