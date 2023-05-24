using TyMachineLearning
using Test

@testset "计算欧几里得距离.jl" begin
    X = [
        0.814723686393179 0.913375856139019
        0.905791937075619 0.632359246225410
        0.126986816293506 0.0975404049994095
    ]

    Y = [
        0.278498218867048 0.964888535199277
        0.546881519204984 0.157613081677548
        0.957506835434298 0.970592781760616
    ]
    @test size(X, 2) == size(Y, 2)
    Distance = "euclidean"
    @test size(pdist2(X, Y, Distance)) == (size(X, 1), size(Y, 1))
end
