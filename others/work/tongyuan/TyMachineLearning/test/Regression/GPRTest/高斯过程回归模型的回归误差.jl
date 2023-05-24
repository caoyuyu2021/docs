using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "高斯过程回归模型的回归误差" begin
    #读取数据集
    X_reg, y_reg = get_diabetes()
    rgp_mdl = fitrgp(X_reg, y_reg)
    lss = loss(rgp_mdl, X_reg, y_reg)
    @test lss > 0
end
