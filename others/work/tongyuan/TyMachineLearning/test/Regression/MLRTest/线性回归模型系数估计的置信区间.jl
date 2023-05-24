using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "线性回归模型系数估计的置信区间.jl" begin
    #划分数据集
    data = DataFrame(;
        g1=[1, 2, 1, 2, 1, 2, 1, 2],
        g2=["hi", "hi", "lo", "lo", "hi", "hi", "lo", "lo"],
        g3=["may", "may", "may", "may", "june", "june", "june", "june"],
        y=[52.7, 57.5, 45.9, 44.5, 53.0, 57.0, 45.9, 44.0],
    )
    rename!(data, [:y => :Y, :g1 => :x1, :g2 => :x2, :g3 => :x3])
    modelspec = "Y~C(x1) + C(x2) + C(x3)"
    model, _, _ = fitlm(data, modelspec)
    alpha = 0.05
    res = coefCI(model, alpha)
    @test res[1][1] > 10
end
