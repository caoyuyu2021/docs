using DataFrames
using CSV
using TyMachineLearning
using Test

@testset "非线性降维的光谱嵌入SE.jl" begin
    affinity = ["nearest_neighbors", "rbf", "precomputed", "precomputed_nearest_neighbors"]
    X = get_digits()
    embedding = fitSpectralEmbedding(affinity[1]; n_components=2)
    transformed = embedding.fit_transform(X[1:100, :])
    @test size(transformed) == (100, 2)
end
