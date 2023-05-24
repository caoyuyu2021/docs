using DataFrames
using CSV
using TyMachineLearning
using Test

@testset "局部线性嵌入LLE.jl" begin
    X = get_digits()
    embedding, ev = fitLocallyLinearEmbedding(X; n_components=2)
    transformed = embedding.fit_transform(X[1:100, :])
    EVED = ev.fit_transform(X[1:100, :])
    @test size(transformed) == (100, 2)
end
