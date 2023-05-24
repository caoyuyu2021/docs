using Test
using CSV
using TyMachineLearning
using DataFrames

@testset "旋转系数荷载.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/DimReduction/rotate.csv")
    rotdata = CSV.read(file, DataFrame; header=false)
    @test size(rotdata) == (10, 3)
    #划分数据集
    X = Array(rotdata)
    X = X'
    m = 2
    res = rotatefactors(X, m)
    @test size(res) == (3, 2)
end
