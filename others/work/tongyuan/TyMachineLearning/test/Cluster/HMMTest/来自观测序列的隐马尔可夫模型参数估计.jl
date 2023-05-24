using TyMachineLearning
using Test
using DataFrames
using CSV

@testset "来自观测序列的隐马尔可夫模型参数估计.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Cluster/hmmtrain.csv")
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
    #参数估计
    estTR, estE = hmmtrain(seq, trans, emis)
    @test size(estTR) == size(trans)
    @test size(estE, 1) == size(emis, 1)
end
