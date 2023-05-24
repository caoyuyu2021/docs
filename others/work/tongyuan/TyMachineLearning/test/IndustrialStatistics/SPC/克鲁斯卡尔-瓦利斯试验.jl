using Test
using CSV
using DataFrames
using PyCall

@testset "克鲁斯卡尔-瓦利斯试验.jl" begin
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Industrial_Statistics/kru.csv")
    fgdata_x = CSV.read(file1, DataFrame; header=0)
    fgdata_x1 = Matrix(fgdata_x)
    #划分数据集
    A = fgdata_x1'[1, :]
    B = fgdata_x1'[2, :]
    C = fgdata_x1'[3, :]
    res = kruskalwallis(A, B, C)
    @test res[2] > 0
end
