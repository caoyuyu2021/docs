using DataFrames
using CSV
using TyMachineLearning
using Test

@testset "建立局部异常点因子模型进行异常检测.jl" begin
    adultdata = joinpath(pkgdir(TyMachineLearning), "data/Cluster/adultdata.csv")
    adulttest = joinpath(pkgdir(TyMachineLearning), "data/Cluster/adulttest.csv")
    iforestdata = CSV.read(adultdata, DataFrame; header=1)
    iforesttest = CSV.read(adulttest, DataFrame; header=1)
    IF = iforestdata[:, [1, 3, 5, 11, 12, 13]]
    IFTest = iforesttest[:, [1, 3, 5, 11, 12, 13]]
    X = Matrix(IF)
    X_test = Matrix(IFTest)
    mdl2, tf2, score2 = lof(X, 0.1, "True")
    res1 = isanomaly(mdl2, X_test)
    @test size(res1) == (16281,)
end
