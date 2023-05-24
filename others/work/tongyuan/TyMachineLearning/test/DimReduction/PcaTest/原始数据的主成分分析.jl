using Test
using CSV
using TyMachineLearning
using DataFrames

@testset "原始数据的主成分分析.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/DimReduction/pca.csv")
    pcadata = CSV.read(file, DataFrame; header=false)
    @test size(pcadata) == (13, 4)
    #划分数据集
    x = Matrix(pcadata)
    pcacoeff, explainedvar, mdl = pca(x)
    @test size(pcacoeff) == (4, 4)
end
