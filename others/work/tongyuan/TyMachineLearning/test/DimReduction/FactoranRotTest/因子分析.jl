using Test
using CSV
using TyMachineLearning
using DataFrames

@testset "因子分析.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/DimReduction/factoran.csv")
    factordata = CSV.read(file, DataFrame; header=false)

    @test size(factordata) == (100, 6)
    #划分数据集
    x = Array(factordata)
    x = x'
    m = 2
    res = factoran(x, m)
    @test size(res) == (6, 2)
end
