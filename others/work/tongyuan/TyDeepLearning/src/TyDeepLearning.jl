module TyDeepLearning
using PyCall

const BACKEND = Ref(:mindspore)

const _SYMS = [
    :set_backend,
    :Accuracy,
    :PlotROC,
    :SequentialCell,
    :addLayers,
    :alexnet,
    :augment,
    :augmentedImageDatastore,
    :averagePooling1dLayer,
    :averagePooling2dLayer,
    :averagePooling3dLayer,
    :avgpool,
    :batchNormalization1dLayer,
    :batchNormalization2dLayer,
    :batchNormalization3dLayer,
    :batchnorm,
    :bilstmLayer,
    :classify,
    :classifyAndUpdateState,
    :clippedReluLayer,
    :confusionchart,
    :convolution1dLayer,
    :convolution2dLayer,
    :convolution3dLayer,
    :crop2dLayer,
    :crop3dLayer,
    :crossChannelNormalizationLayer,
    :crosschannelnorm,
    :crossentropy,
    :dataloader,
    :decode,
    :dlconv,
    :dltranspconv,
    :dropoutLayer,
    :eluLayer,
    :encode,
    :feedforwardnet,
    :fitnet,
    :flattenLayer,
    :fullyConnectedLayer,
    :fullyconnect,
    :globalAveragePooling1dLayer,
    :globalAveragePooling2dLayer,
    :globalMaxPooling1dLayer,
    :globalMaxPooling2dLayer,
    :globalMaxPooling3dLayer,
    :googlenet,
    :groupNormalizationLayer,
    :groupedConvolution2dLayer,
    :groupnorm,
    :gruLayer,
    :huber,
    :imageDataAugmenter,
    :inceptionv3,
    :instanceNormalization1dLayer,
    :instanceNormalization2dLayer,
    :instanceNormalization3dLayer,
    :isequal,
    :isequaln,
    :layerGraph,
    :layerNormalizationLayer,
    :layernorm,
    :leakyReluLayer,
    :leakyrelu,
    :lgplot,
    :lstm,
    :lstmLayer,
    :maxPooling1dLayer,
    :maxPooling2dLayer,
    :maxPooling3dLayer,
    :maxpool,
    :mobilenetv2,
    :mse,
    :ploterrhist,
    :plotfit,
    :plotperform,
    :plotregression,
    :plotroc,
    :predict,
    :predictAndUpdateState,
    :probability2classes,
    :regression,
    :relu,
    :reluLayer,
    :removeLayers,
    :replaceLayer,
    :resnet101,
    :resnet18,
    :resnet50,
    :roc,
    :sequenceUnfoldingLayer,
    :shufflenet,
    :sigmoid,
    :sigmoidLayer,
    :simplefit_dataset,
    :softmax,
    :softmaxLayer,
    :sortClasses,
    :swishLayer,
    :tanhLayer,
    :train,
    :trainAutoencoder,
    :trainNetwork,
    :trainSoftmaxLayer,
    :trainingOptions,
    :transposedConv1dLayer,
    :transposedConv2dLayer,
    :transposedConv3dLayer,
    :xception,
    :save,
    :load,
    :iris_dataset,
    :patternnet,
    :plottrainstate,
    :resetState,
    :DigitTrain4DArrayData,
    :dataset_dir,
    :DigitDatasetTrainData,
    :DigitDatasetTestData,
    :iris_dataset
]

const _PYTHON_PATH = abspath(joinpath(@__DIR__, "..", "python"))

module MindSpore
    using PyCall

    _SRC_FILES = [
        "Images/Layers.jl",
        "Images/DAG.jl",
        "Images/Prediction.jl",
        "Images/PreImages.jl",
        "Images/PreTrained.jl",
        "Images/Dataset.jl",
        "SeqText/Layers.jl",
        "Images/TyPlots.jl",
        "CustomTrain/Operations.jl",
        "Images/TrainNetwork.jl",
        "Toolfunctions/Toolfunctions.jl",
        "ApproControl/Autoencoders.jl",
        "ApproControl/ApproRegression.jl",
    ]
    _PATH = abspath(joinpath(@__DIR__, "..", "src/mindspore/"))

    for paths in eachindex(_SRC_FILES)
        include(_PATH * _SRC_FILES[paths])
    end

    function ensure_init()
        pyimport("mindspore")
        return println("Mindspore ready!")
    end

end

module Torch
    using PyCall

    function ensure_init()
        pyimport("torch")
        _SRC_FILES = [
            "Images/Layers.jl",
            "Images/DAG.jl",
            "Images/Prediction.jl",
            "Images/PreImages.jl",
            "Images/PreTrained.jl",
            "Images/Dataset.jl",
            "SeqText/Layers.jl",
            "Images/TyPlots.jl",
            "CustomTrain/Operations.jl",
            "Images/TrainNetwork.jl",
            "Toolfunctions/Toolfunctions.jl",
            "ApproControl/Autoencoders.jl",
            "ApproControl/ApproRegression.jl",
        ]
        _PATH = abspath(joinpath(@__DIR__, "..", "src/pytorch/"))

        for paths in eachindex(_SRC_FILES)
            include(_PATH * _SRC_FILES[paths])
        end
        return println("Torch ready!")
    end

end

for f in _SYMS
    @eval function $f(args...; kwargs...)
        if BACKEND[] == :mindspore
            MindSpore.$f(args...; kwargs...)
        elseif BACKEND[] == :torch
            Torch.$f(args...; kwargs...)
        else
            error("Unknown backend: $(BACKEND[])")
        end
    end
end

function set_backend(backend)
    if backend == :mindspore
        MindSpore.ensure_init()
        BACKEND[] = backend
    elseif backend == :torch
        Torch.ensure_init()
        BACKEND[] = backend
    else
        error("Unknown backend: $(backend)")
    end
end

for sym in _SYMS
    @eval export $sym
end

function _set_python_path(path)
    py"""
    import sys
    def set_path(path):
        if path not in sys.path:
            sys.path.append(path)
    """
    return py"set_path"(path)
end

function __init__()
    return _set_python_path(_PYTHON_PATH)
end

end