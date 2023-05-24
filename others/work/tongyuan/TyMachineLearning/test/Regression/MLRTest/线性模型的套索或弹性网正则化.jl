using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "线性模型的套索或弹性网正则化.jl" begin
    #读取数据集
    X_reg, y_reg = get_diabetes()
    MDL, B = lasso(X_reg, y_reg)
    y_pre = TyMachineLearning.predict(MDL, X_reg)
    @test y_pre[1] > 0
end
