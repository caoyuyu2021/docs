using TyDeepLearning
using Test
using CSV
using DataFrames


@testset "trainingOptions.jl" begin
    #获取数据集
    file1 = joinpath(dataset_dir("iris"), "irisInputs.csv")
    file2 = joinpath(dataset_dir("iris"), "irisTargets.csv")
    data = CSV.read(file1, DataFrame; header=false)
    label = CSV.read(file2, DataFrame; header=false)
    #获取训练数据集
    train_data = Array(data[1:2:end, :])
    train_label = Array(label[1:2:end, :])
    #获取验证数据集
    validation_data = Array(data[2:2:end, :])
    validation_label = Array(label[2:2:end, :])
    #设置网络层
    layers = SequentialCell([
        fullyConnectedLayer(4, 4), reluLayer(), fullyConnectedLayer(4, 3)
    ])
    #设置参数
    LearnRate = 1e-2
    Loss = "CrossEntropyLoss"
    Optimizer = "SGD"
    Metrics = "Accuracy"
    BatchSize = 30
    Epoch = 20
    options = trainingOptions(
        Loss,
        Optimizer,
        Metrics,
        BatchSize,
        Epoch,
        LearnRate;
        Shuffle=false,
        Verbose=false,
        Plots=true,
    )
    @test options["metrics"] == "Accuracy"
    @test options["optimizer"] == "SGD"
    @test options["epoch"] == 20
    @test options["batch_size"] == 30
    @test options["momentum"] == 0.9
    @test options["plots"] == true
    @test options["learning_rate"] == 0.01
    @test options["verbose"] == false
    @test options["loss"] == "CrossEntropyLoss"
    @test options["shuffle"] == false
end
