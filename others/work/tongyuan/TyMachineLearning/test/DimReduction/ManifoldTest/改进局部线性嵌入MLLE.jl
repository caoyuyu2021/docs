using DataFrames
using CSV
using TyMachineLearning
using Test

@testset "改进局部线性嵌入MLLE.jl" begin
    X = get_digits()
    embedding = fitMLLEmbedding(; n_neighbors=12, n_components=2)
    transformed = embedding.fit_transform(X[1:100, :])
    @test size(transformed) == (100, 2)
end
