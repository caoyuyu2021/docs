using TyDeepLearning
using CSV
using DataFrames
using Test

@testset "regression.jl" begin
    @testset "计算并绘制经过训练以识别鸢尾花的网络的 ROC" begin
        outputs = [
            [0.28, 0.55, 0.15, 0.05],
            [0.10, 0.20, 0.05, 0.05],
            [0.20, 0.05, 0.15, 0.05],
            [0.05, 0.05, 0.05, 0.75],
        ]
        targets = [0, 1, 2, 3]
        fpr, tpr, thresholds = roc(targets, outputs)
        @test size(fpr) == (4,)
        @test size(tpr) == (4,)
        @test size(thresholds) == (4,)
    end
end
