using TyMachineLearning
using Test
using DataFrames
using CSV

@testset "绘制具有最佳叶序的树状图.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Cluster/optimalleaforder.csv")
    X = CSV.read(file, DataFrame; header=false)
    @test size(X) == (10, 2)
    #参数设置
    method = "average"
    tree = linkage(X, method)
    D = pdist(X)
    @test length(optimalleaforder(tree, D)) == size(X, 1)
end
