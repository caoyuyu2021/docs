using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "拟合ridge回归模型" begin
    #读取数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/ridge_x.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/ridge_y.csv")
    file3 = joinpath(pkgdir(TyMachineLearning), "data/Regression/ridge_k.csv")
    lasdata_x = CSV.read(file1, DataFrame; header=false)
    lasdata_y = CSV.read(file2, DataFrame; header=false)
    lasdata_k = CSV.read(file3, DataFrame; header=false)
    #划分数据集
    x_pre = Matrix(lasdata_x)
    y_pre = lasdata_y.Column1
    k1 = lasdata_k[:, 2]
    k2 = lasdata_k[:, end]
    mdl, w = ridge(x_pre, y_pre; k=[1.0e-5, 1.0e-4, 0.005])
    y_pre = TyMachineLearning.predict(mdl, x_pre)
    @test mdl.score(x_pre, y_pre) > 0 
end
