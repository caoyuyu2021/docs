using TyMachineLearning
using Test
using DataFrames
using CSV

@testset "计算欧氏距离并将距离向量转换为矩阵.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Cluster/squareform.csv")
    X = CSV.read(file, DataFrame; header=false)
    @test size(X) == (3, 2)
    #计算距离
    yIn = pdist(X)
    @test size(squareform(yIn)) == (length(yIn), length(yIn))
end
