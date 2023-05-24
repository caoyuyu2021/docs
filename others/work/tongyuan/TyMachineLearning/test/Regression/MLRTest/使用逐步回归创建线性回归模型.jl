using Test
using TyMachineLearning
using CSV
using DataFrames

@testset "使用逐步回归创建线性回归模型.jl" begin
    # 加载数据集并训练模型
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/Fitglm_x.csv")
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Regression/Fitglm_y.csv")
    X = Matrix(CSV.read(file1, DataFrame; header=0))
    y = CSV.read(file2, DataFrame; header=0).Column1
    spglm = stepwiselm(X, y)
    @test spglm.pvalues.X_1 > 0
end