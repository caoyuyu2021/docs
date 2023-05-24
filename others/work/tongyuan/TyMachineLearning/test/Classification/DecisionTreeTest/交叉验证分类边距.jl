using Test
using TyMachineLearning
using CSV
using DataFrames
using Statistics

@testset "交叉验证分类边距.jl" begin
    # 加载数据集并训练模型
    iris_X, iris_y = get_irsdata()
    mdl = fitcknn(iris_X, iris_y)
    iris = hcat(iris_X, iris_y)
    m = kfoldMargin(mdl, iris, 10)
    marginStats = DataFrame(; Min=minimum(m), Mean=mean(m), Max=maximum(m))
    @test size(m) == (150,)
end
