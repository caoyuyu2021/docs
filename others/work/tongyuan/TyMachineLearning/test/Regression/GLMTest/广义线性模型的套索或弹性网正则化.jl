using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "广义线性模型的套索或弹性网正则化.jl" begin
    #读取数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/lasuo_x.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/lasuo_y.csv")
    lasdata_x = CSV.read(file1, DataFrame; header=false)
    lasdata_y = CSV.read(file2, DataFrame; header=false)
    X = Matrix(lasdata_x)
    y = lasdata_y.Column1
    MDL_r, B_r = lassoglm(X, y; alpha=0.1, distr=0)
    @test MDL_r.score(X, y) > 0
end
