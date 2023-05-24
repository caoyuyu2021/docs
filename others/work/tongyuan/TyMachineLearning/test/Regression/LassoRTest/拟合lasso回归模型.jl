using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "拟合lasso回归模型" begin
    #读取数据集
    X_reg, y_reg = get_diabetes()
    MDL, B = lasso(X_reg, y_reg)
    @test size(B) == (10,)
end