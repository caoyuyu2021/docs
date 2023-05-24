using TyDeepLearning
using Test
using CSV
using DataFrames
using PyCall

@testset "trainAutoencoder.jl" begin
    #获取数据集
    file = joinpath(dataset_dir("iris"), "irisInputs.csv")
    data = CSV.read(file, DataFrame; header=false)
    #获取训练数据集
    train_data = Array(data[1:2:end, :])
    #参数设置
    x = train_data
    hiddensize = 64
    autoenc = trainAutoencoder(x, hiddensize)
    @test typeof(autoenc) <: PyObject
end
