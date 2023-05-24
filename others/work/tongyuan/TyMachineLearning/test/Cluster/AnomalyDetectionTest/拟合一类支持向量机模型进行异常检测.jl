using DataFrames
using CSV
using TyMachineLearning
using Test

@testset "拟合一类支持向量机模型进行异常检测.jl" begin
    adultdata = joinpath(pkgdir(TyMachineLearning), "data/Cluster/adultdata.csv")
    adulttest = joinpath(pkgdir(TyMachineLearning), "data/Cluster/adulttest.csv")
    iforestdata = CSV.read(adultdata, DataFrame; header=1)
    iforesttest = CSV.read(adulttest, DataFrame; header=1)
    IF = iforestdata[:, [1, 3, 5, 11, 12, 13]]
    IFTest = iforesttest[:, [1, 3, 5, 11, 12, 13]]
    X = Matrix(IF)
    X_pre = X[1:1000, :]
    mdl, tf, score = ocsvm(X_pre)
    @test size(score) == (1000,)
end
