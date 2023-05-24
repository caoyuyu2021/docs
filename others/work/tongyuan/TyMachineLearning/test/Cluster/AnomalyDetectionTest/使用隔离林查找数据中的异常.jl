using DataFrames
using CSV
using TyMachineLearning
using Test

@testset "使用隔离林查找数据中的异常.jl" begin
    adultdata = joinpath(pkgdir(TyMachineLearning), "data/Cluster/adultdata.csv")
    adulttest = joinpath(pkgdir(TyMachineLearning), "data/Cluster/adulttest.csv")
    iforestdata = CSV.read(adultdata, DataFrame; header=1)
    iforesttest = CSV.read(adulttest, DataFrame; header=1)
    IF = iforestdata[:, [1, 3, 5, 11, 12, 13]]
    IFTest = iforesttest[:, [1, 3, 5, 11, 12, 13]]
    X = Matrix(IF)
    X_test = Matrix(IFTest)
    mdl, tf, score = iforest(X)
    res = isanomaly(mdl, X_test)
    @test size(res) == (16281,)
end
