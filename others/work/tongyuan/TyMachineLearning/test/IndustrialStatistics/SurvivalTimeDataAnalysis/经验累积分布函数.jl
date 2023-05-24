using Test
using CSV
using DataFrames
using PyCall

@testset "经验累积分布函数.jl" begin
    #读取数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Industrial_Statistics/ecdf.csv")
    fgdata_y = CSV.read(file1, DataFrame; header=0)
    @test size(fgdata_y) == (15, 1)
    y = fgdata_y.Column1
    res = TyMachineLearning.ecdf(y)
    @test size(res.y) == (16,)
end
