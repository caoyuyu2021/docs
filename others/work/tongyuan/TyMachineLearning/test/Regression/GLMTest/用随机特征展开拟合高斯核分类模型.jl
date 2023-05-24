using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "用随机特征展开拟合高斯核分类模型.jl" begin
    #读取数据集
    X_reg, y_reg = get_diabetes()
    clf = fitrkernel(X_reg, y_reg)
    @test clf.score(X_reg, y_reg) > 0
end