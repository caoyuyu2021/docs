using TyMachineLearning
using Test
using DataFrames
using CSV

@testset "计算欧几里德距离并将距离向量转换为矩阵.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Cluster/pdist.csv")
    X = CSV.read(file, DataFrame; header=false)
    @test size(X) == (3, 2)
    #计算距离
    dis = pdist(X)
    @test length(dis) == 3
end
