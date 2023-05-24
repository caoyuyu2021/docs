using Test
using CSV
using TyMachineLearning
using DataFrames

@testset "巴特利特检验.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/DimReduction/barttest.csv")
    btt = CSV.read(file, DataFrame; header=false)
    @test size(btt) == (20, 6)
    #划分数据集
    x1 = btt[:, 1]
    x2 = btt[:, 2]
    x3 = btt[:, 3]
    x4 = btt[:, 4]
    x5 = btt[:, 5]
    x6 = btt[:, 6]
    #数据集检验
    stat, p = barttest(x1, x2, x3, x4, x5, x6)
    @test p > 0
end
