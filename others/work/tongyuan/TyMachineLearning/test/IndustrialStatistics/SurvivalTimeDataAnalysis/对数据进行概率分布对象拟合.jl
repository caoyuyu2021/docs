using Test
using CSV
using DataFrames
using PyCall

@testset "对数据进行概率分布对象拟合.jl" begin
    #读取数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Industrial_Statistics/dis.csv")
    fgdata_x = CSV.read(file1, DataFrame; header=0)
    fgdata_x1 = fgdata_x.Column1
    # #划分数据集
    X = fgdata_x1
    name = ["norm"]
    f = fitdist(X, name)
    @test f.histdata[1][1] > 0
end
