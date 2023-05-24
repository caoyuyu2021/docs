using DataFrames
using CSV
using TyMachineLearning
using Test

@testset "等距映射.jl" begin
    X = get_digits()
    embedding, ev = fitIsomap(X; n_components=2)
    transformed = embedding.fit_transform(X[1:100, :])
    EVED = ev.fit_transform(X[1:100, :])
    @test size(transformed) == (100, 2)
end
