using Test
using CSV
using TyMachineLearning
using DataFrames

@testset "经典多维标度.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/DimReduction/mds.csv")
    mdsdata = CSV.read(file, DataFrame; header=false)
    @test size(mdsdata) == (10, 10)
    #划分数据集
    X = Array(mdsdata)
    cmd, Y = cmdscale(X)
    @test size(Y) == (10, 2)
end
