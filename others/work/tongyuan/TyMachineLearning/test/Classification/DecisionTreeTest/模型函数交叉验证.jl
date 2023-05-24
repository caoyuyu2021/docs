using Test
using TyMachineLearning
using CSV
using DataFrames
using Statistics

@testset "模型函数交叉验证.jl" begin
    # 加载数据集并训练模型
    function f1_score(y_true, y_pred)
        n_classes = length(unique(y_true))
        f1_scores = zeros(n_classes)
        for i in 1:n_classes
            tp = sum((y_true .== i - 1) .& (y_pred .== i - 1))
            fp = sum((y_true .!= i - 1) .& (y_pred .== i - 1))
            fn = sum((y_true .== i - 1) .& (y_pred .!= i - 1))
            precision = tp / (tp + fp)
            recall = tp / (tp + fn)
            f1_scores[i] = 2 * precision * recall / (precision + recall)
        end
        return mean(f1_scores)
    end

    iris_X, iris_y = get_irsdata()
    mdl = fitctree(iris_X, iris_y)
    iris = hcat(iris_X, iris_y)
    iris[1:5, :]
    ve = kfoldfun(mdl, iris, 10, f1_score)
    @test size(ve) == (10,)
end
