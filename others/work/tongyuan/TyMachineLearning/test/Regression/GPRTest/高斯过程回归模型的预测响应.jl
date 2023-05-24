using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "高斯过程回归模型的预测响应" begin
    #读取数据集
    X_reg, y_reg = get_diabetes()
    rgp_mdl = fitrgp(X_reg, y_reg)
    y_pre = TyMachineLearning.predict(rgp_mdl, X_reg)
    @test y_pre[1] > 0
end
