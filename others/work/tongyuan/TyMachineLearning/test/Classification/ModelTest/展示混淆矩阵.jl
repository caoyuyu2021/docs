using TyMachineLearning
using CSV
using DataFrames
using Test

@testset "展示混淆矩阵.jl" begin
    #读取数据集
    y_true = [3, 2, 2, 3, 1, 1]
    y_pred = [4, 2, 3, 1, 1, 1]
    #计算混淆矩阵
    res = confusionmat(y_true, y_pred)
    @test max(maximum(unique(y_true)), maximum(unique(y_pred))) == size(res, 1)
end
