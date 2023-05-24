using DataFrames
using CSV
using TyMachineLearning
using Test

@testset "拟合隔离林用于异常检测.jl" begin
    adultdata = joinpath(pkgdir(TyMachineLearning), "data/Cluster/adultdata.csv")
    adulttest = joinpath(pkgdir(TyMachineLearning), "data/Cluster/adulttest.csv")
    iforestdata = CSV.read(adultdata, DataFrame; header=1)
    iforesttest = CSV.read(adulttest, DataFrame; header=1)
    IF = iforestdata[:, [1, 3, 5, 11, 12, 13]]
    IFTest = iforesttest[:, [1, 3, 5, 11, 12, 13]]
    X = Matrix(IF)
    mdl, tf, score = iforest(X)
    @test size(score) == (32561,)
end
