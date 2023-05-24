using Test
using CSV
using TyMachineLearning
using DataFrames

@testset "马氏距离.jl" begin
    file1 = joinpath(pkgdir(TyMachineLearning), "data/DimReduction/mahal_X.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/DimReduction/mahal_Y.csv")
    mahaldata_X = CSV.read(file1, DataFrame; header=false)
    mahaldata_Y = CSV.read(file2, DataFrame; header=false)
    @test size(mahaldata_X) == (1000, 2)
    @test size(mahaldata_Y) == (4, 2)
    #划分数据集
    X = Array(mahaldata_X)
    Y = Array(mahaldata_Y)
    res = mahal(Y, X)
    @test size(res) == (4, 1000)
end
