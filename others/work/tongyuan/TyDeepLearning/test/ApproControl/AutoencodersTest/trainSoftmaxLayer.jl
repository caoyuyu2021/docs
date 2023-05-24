using TyDeepLearning
using Test
using CSV
using DataFrames
using PyCall

@testset "trainSoftmaxLayer.jl" begin
    #获取数据集
    file1 = joinpath(dataset_dir("iris"), "irisInputs.csv")
    file2 = joinpath(dataset_dir("iris"), "irisTargets.csv")
    data = CSV.read(file1, DataFrame; header=false)
    target = CSV.read(file2, DataFrame; header=false)
    #获取训练数据集
    train_data = Array(data[1:2:end, :])
    train_target = Array(target)
    #参数设置
    x = train_data
    t = train_target
    autoenc = trainSoftmaxLayer(x, t)
    @test typeof(autoenc) <: PyObject
end
