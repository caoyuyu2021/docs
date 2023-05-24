using TyMachineLearning
using Test
using DataFrames
using CSV

@testset "绘制树状图.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Cluster/dendrogram.csv")
    X = CSV.read(file, DataFrame; header=false)
    @test size(X) == (10, 3)
    #参数设置
    method = "average"
    tree = linkage(X, method)
    @test length(tree) == 36
    #dendrogram(tree)
end
