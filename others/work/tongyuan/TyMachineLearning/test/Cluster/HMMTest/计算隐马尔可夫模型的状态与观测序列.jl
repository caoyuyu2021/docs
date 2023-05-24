using TyMachineLearning
using Test

@testset "计算隐马尔可夫模型的状态与观测序列.jl" begin
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
    #序列长度
    len = 100
    #计算状态与观测序列
    seq, states = hmmgenerate(len, trans, emis)
    @test length(seq) == len
    @test length(states) == len
end
