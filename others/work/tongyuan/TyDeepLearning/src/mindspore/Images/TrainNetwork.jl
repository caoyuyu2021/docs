function trainingOptions(
    Loss,
    Optimizer,
    Metrics,
    BatchSize,
    Epoch,
    LearnRate;
    Shuffle=false,
    Verbose=true,
    Plots=false,
    Momentum=0.9,
    CheckpointPath=nothing,
    ExecutionEnvironment="auto",
    XValidation=nothing,
    YValidation=nothing,
)
    py"""
    from Train_M import trainingoptions
    """
    py"trainingoptions"(;
        loss=Loss,
        optimizer=Optimizer,
        metrics=Metrics,
        batch_size=BatchSize,
        epoch=Epoch,
        learning_rate=LearnRate,
        shuffle=Shuffle,
        verbose=Verbose,
        plots=Plots,
        momentum=Momentum,
        checkpointpath=CheckpointPath,
        executionenvironment=ExecutionEnvironment,
        eval_data=XValidation,
        eval_label=YValidation,
    )
end

function trainNetwork(
    XTrain,
    YTrain,
    layers,
    options
)
    py"""
    from Train_M import trainnetwork
    """
    net = py"trainnetwork"(;
        train_data=XTrain,
        train_label=YTrain,
        layers=layers,
        options=options
    )
    #绘制loss曲线和指标曲线
    FinalPlots(options)
    return net
end

function save(net, file_name; input_tensor=nothing)
    """
    训练深度学习神经网络
    Args:
        net (网络层): Network
        file_name (模型路径): String
        file_format (模型格式): {
            MINDIR
            CKPT
        }
        input_tensor (训练模型的输入数据): Tensor
    Returns:
        nothing
    """
    if occursin("mindir", file_name)
        py"""
        from Train_M import exportmindir
        """
        input_tensor = Array(input_tensor)
        if ndims(input_tensor) == 2
            columns = size(input_tensor, 2)
            input_tensor = reshape(input_tensor[1, :], (1, columns))
        elseif ndims(input_tensor) == 3
            columns = size(input_tensor, 3)
            input_tensor = reshape(input_tensor[1, :, :], (1, 1, columns))
        end
        py"exportmindir"(net, file_name, input_tensor)
    else
        py"""
         from mindspore import save_checkpoint
         """
        py"save_checkpoint"(net, file_name)
    end
end

function load(file_name; net=nothing)
    if occursin("mindir", file_name)
        py"""
        from Train_M import loadmindir
        """
        py"loadmindir"(file_name)
    else
        py"""
        from Train_M import loadmodel
        """
        py"loadmodel"(net, file_name)
    end
end