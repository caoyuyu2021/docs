function trainingOptions(Loss,
    Optimizer,
    Metrics,
    BatchSize,
    Epoch,
    LearnRate;
    Shuffle = false,
    Verbose = true,
    Plots = false,
    Momentum = 0.9,
    CheckpointPath = nothing,
    ExecutionEnvironment = "auto",
    XValidation = nothing,
    YValidation = nothing)
    py"""
    from Train_T import *
    """
    py"trainingoptions"(;
        loss = Loss,
        optimizer = Optimizer,
        metrics = Metrics,
        batch_size = BatchSize,
        epoch = Epoch,
        learning_rate = LearnRate,
        shuffle = Shuffle,
        verbose = Verbose,
        plots = Plots,
        momentum = Momentum,
        checkpointpath = CheckpointPath,
        executionenvironment = ExecutionEnvironment,
        eval_data = XValidation,
        eval_label = YValidation)
end

function trainNetwork(XTrain,
    YTrain,
    layers,
    options)
    py"""
   from Train_T import *
   """
    net = py"trainnetwork"(;
        train_data = XTrain,
        train_label = YTrain,
        layers = layers,
        options = options
    )
    #绘制loss曲线和指标曲线
    FinalPlots(options)
    return net
end

function save(net, file)
    #将网络权重保存到checkpoint文件中
    py"""
    from Train_T import *
    """
    py"savemodel"(net, file)
end

function load(net, file)
    #加载checkpoint文件
    py"""
    from Train_T import *
    """
    py"loadmodel"(net, file)
end

