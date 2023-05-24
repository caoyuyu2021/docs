using Test
using CSV
using DataFrames
using PyCall

@testset "最大似然估计.jl" begin
    #读取数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Industrial_Statistics/mle.csv")
    fgdata_x = CSV.read(file1, DataFrame; header=0)
    @test size(fgdata_x) == (406, 1)
    phat, pci = TyMachineLearning.mle(fgdata_x)
    @test phat > 0
end
