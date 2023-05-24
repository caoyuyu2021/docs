using DataFrames
using CSV
using TyMachineLearning
using Test

@testset "局部切线空间对齐LTSA.jl" begin
    S_points, S_color = get_curve()
    embedding = fitltsaEmbedding(S_points)
    transformed = embedding.fit_transform(S_points[1:100, :])
    @test size(transformed) == (100, 2)
end
