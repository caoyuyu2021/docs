using Test
using CSV
using TyMachineLearning
using DataFrames

@testset "非负矩阵分解.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/DimReduction/nnmf.csv")
    nmfdata = CSV.read(file, DataFrame; header=false)
    @test size(nmfdata) == (150, 4)
    #划分数据集
    X = Array(nmfdata)
    k = 2
    res = nnmf(X, k)
    @test size(res[1]) == (150, 2)
end
