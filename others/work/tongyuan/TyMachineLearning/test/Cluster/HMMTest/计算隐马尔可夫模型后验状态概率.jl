using TyMachineLearning
using Test
using DataFrames
using CSV

@testset "计算隐马尔可夫模型后验状态概率.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Cluster/hmmdecode.csv")
    X = CSV.read(file, DataFrame; header=false)
    #观测序列
    seq = X
    @test size(seq) == (1, 100)
    #状态转移概率矩阵
    trans = [
        0.95 0.05
        0.10 0.90
    ]
    #输出观测概率矩阵
    emis = [
        1/6 1/6 1/6 1/6 1/6 1/6
        1/10 1/10 1/10 1/10 1/10 1/2
    ]
    #计算后验概率
    res = hmmdecode(seq, trans, emis)
    @test sum(res .>= 0) == size(res, 1) * size(res, 2)
    @test sum(res .<= 1) == size(res, 1) * size(res, 2)
end
