using TyDeepLearning
using Test
using CSV
using DataFrames

@testset "encode.jl" begin
    #获取数据集
    file = joinpath(dataset_dir("iris"), "irisInputs.csv")
    data = CSV.read(file, DataFrame; header=false)
    #获取训练数据集
    train_data = Array(data[1:2:end, :])
    test_data = Array(data[2:2:end, :])
    #参数设置
    x = train_data
    Xnew = test_data
    hiddensize = 64
    autoenc = trainAutoencoder(x, hiddensize)
    Z = encode(autoenc, Xnew)
    @test size(Z) == (75, 64)
end
