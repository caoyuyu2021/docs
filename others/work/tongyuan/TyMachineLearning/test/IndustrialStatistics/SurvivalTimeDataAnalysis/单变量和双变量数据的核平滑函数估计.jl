using Test
using CSV
using DataFrames
using PyCall

@testset begin
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Industrial_Statistics/ksd.csv")
    fgdata_x = CSV.read(file1, DataFrame; header=0)
    fgdata_x1 = fgdata_x.Column1
    # #划分数据集
    X = fgdata_x1
    xi, f = ksdensity(X)
    @test f[2] > 0
end
