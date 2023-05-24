using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "拟合高斯过程回归模型" begin
    #读取数据集
    X_reg, y_reg = get_diabetes()
    rgp_mdl = fitrgp(X_reg, y_reg)
    @test rgp_mdl.score(X_reg, y_reg) > 0
end
