using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "lasso回归模型的响应预测" begin
    #读取数据集
    X_reg, y_reg = get_diabetes()
    MDL, B = lasso(X_reg, y_reg)
    y_pre = TyMachineLearning.predict(MDL, X_reg)
    @test y_pre[1] > 0
end
