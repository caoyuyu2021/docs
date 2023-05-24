using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "基于F检验的回归单变量特征排序" begin
    #读取数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/fsr_x.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/fsr_y.csv")
    lasdata_x = CSV.read(file1, DataFrame; header=false)
    lasdata_y = CSV.read(file2, DataFrame; header=false)
    @test size(lasdata_x) == (7168, 32)
    @test size(lasdata_y) == (7168, 1)
    #划分数据集
    X = lasdata_x
    y = lasdata_y.Column1
    idx, scores = fsrftest(X, y)
    @test size(idx) == (32,)
end
