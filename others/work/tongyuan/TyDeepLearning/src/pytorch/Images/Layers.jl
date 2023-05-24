function convolution1dLayer(
    NumChannels, 
    NumFilters, 
    FilterSize; 
    Stride = 1, 
    PaddingMode = "zeros", 
    PaddingSize = 0, 
    DilationFactor = 1, 
    Bias = false, 
    WeightsInitializer = "normal",
    BiasInitializer = "zeros")
    py"""
    from torch.nn import *
    """
    py"Conv1d"(
    in_channels = NumChannels, 
    out_channels = NumFilters, 
    kernel_size = FilterSize, 
    stride = Stride, 
    padding_mode = PaddingMode, 
    padding = PaddingSize, 
    dilation = DilationFactor, 
    groups = 1, 
    bias = Bias,
    )
end

function convolution2dLayer(
    NumChannels, 
    NumFilters, 
    FilterSize; 
    Stride = 1, 
    PaddingMode = "zeros", 
    PaddingSize = 0, 
    DilationFactor = 1, 
    Bias = false, 
    WeightsInitializer = "normal", 
    BiasInitializer = "zeros"
    )
    py"""
    from torch.nn import *
    """
    py"Conv2d"(
    in_channels = NumChannels, 
    out_channels = NumFilters, 
    kernel_size = FilterSize, 
    stride = Stride, 
    padding_mode = PaddingMode, 
    padding = PaddingSize, 
    dilation = DilationFactor, 
    groups = 1, 
    bias = Bias, 
    )
end

function convolution3dLayer(
    NumChannels, 
    NumFilters, 
    FilterSize; 
    Stride = 1, 
    PaddingMode = "zeros", 
    PaddingSize = 0, 
    DilationFactor = 1, 
    Bias = false, 
    WeightsInitializer = "normal", 
    BiasInitializer = "zeros"
    )
    py"""
    from torch.nn import *
    """
    py"Conv3d"(
    in_channels = NumChannels, 
    out_channels = NumFilters, 
    kernel_size = FilterSize, 
    stride = Stride, 
    padding_mode = PaddingMode, 
    padding = PaddingSize, 
    dilation = DilationFactor, 
    groups = 1, 
    bias = Bias,
    )
end

function groupedConvolution2dLayer(
    NumChannelsPerGroup, 
    NumFiltersPerGroup, 
    FilterSize, NumGroups; 
    Stride = 1, 
    PaddingMode = "same", 
    PaddingSize = 0, 
    DilationFactor = 1, 
    Bias = false, 
    WeightsInitializer = "normal", 
    BiasInitializer = "zeros"
    )
    py"""
    from torch.nn import *
    """
    py"Conv2d"(
    in_channels = NumChannelsPerGroup, 
    out_channels = NumFiltersPerGroup, 
    kernel_size = FilterSize, 
    stride = Stride, 
    padding_mode = PaddingMode, 
    padding = PaddingSize, 
    dilation = DilationFactor,
    groups = NumGroups, 
    bias = Bias, 
    )
end

function transposedConv1dLayer(NumChannels, 
    NumFilters, 
    FilterSize; 
    Stride = 1, 
    PaddingMode = "same", 
    PaddingSize = 0, 
    DilationFactor = 1, 
    Bias = false, 
    WeightsInitializer = "normal", 
    BiasInitializer = "zeros"
    )
    py"""
    from torch.nn import *
    """
    py"ConvTranspose1d"(
    in_channels = NumChannels, 
    out_channels = NumFilters, 
    kernel_size = FilterSize, 
    stride = Stride, 
    padding_mode = PaddingMode, 
    padding = PaddingSize, 
    dilation = DilationFactor, 
    groups = 1, 
    bias = Bias, 
    )
end

function transposedConv2dLayer(
    NumChannels, 
    NumFilters, 
    FilterSize; 
    Stride = 1, 
    PaddingMode = "same", 
    PaddingSize = 0, 
    DilationFactor = 1, 
    Bias = false, 
    WeightsInitializer = "normal", 
    BiasInitializer = "zeros"
    )
    py"""
    from torch.nn import *
    """
    py"ConvTranspose2d"(
    in_channels = NumChannels, 
    out_channels = NumFilters,
    kernel_size = FilterSize, 
    stride = Stride, 
    pad_mode = PaddingMode, 
    padding = PaddingSize, 
    dilation = DilationFactor, 
    groups = 1, 
    bias = Bias, 
    )
end

function transposedConv3dLayer(
    NumChannels, 
    NumFilters, 
    FilterSize; 
    Stride = 1, 
    PaddingMode = "same", 
    PaddingSize = 0, 
    DilationFactor = 1, 
    Bias = false, 
    WeightsInitializer = "normal", 
    BiasInitializer = "zeros")
    py"""
    from torch.nn import *
    """
    py"ConvTranspose3d"(
    in_channels = NumChannels, 
    out_channels = NumFilters,
    kernel_size = FilterSize, 
    stride = Stride, 
    padding_mode = PaddingMode, 
    padding = PaddingSize, 
    dilation = DilationFactor, 
    groups = 1, 
    output_padding = 0, 
    bias = Bias, 
    )
end

function fullyConnectedLayer(InputSize, OutputSize;   Bias = true)
    py"""
    from torch.nn import *
    """
    py"Linear"(in_features = InputSize, out_features = OutputSize, bias = Bias)
end

function reluLayer()
    py"""
    from torch.nn import *
    """
    py"ReLU"()
end

function leakyReluLayer(scale = 0.2)
    py"""
    from torch.nn import *
    """
    py"LeakyReLU"(negative_slope = scale)
end

function clippedReluLayer()
    py"""
    from torch.nn import *
    """
    py"ReLU6"()
end

function eluLayer(alpha = 1.0)
    py"""
    from torch.nn import *
    """
    py"ELU"(alpha = alpha)
end

function tanhLayer()
    py"""
    from torch.nn import *
    """
    py"Tanh"()
end

function swishLayer()
    py"""
    from NetworkLayer_T import Swish
    """
    py"Swish"()
end

function batchNormalization1dLayer(
    NumChannels; 
    Epsilon = 1e-05, 
    MeanVarianceDecay = 0.9, 
    ScaleInitializer = "ones", 
    OffsetInitializer = "zeros"
    )
    py"""
    from torch.nn import *
    """
    py"BatchNorm1d"(
    num_features = NumChannels, 
    eps = Epsilon, 
    momentum = MeanVarianceDecay, 
    affine = true, 
    )
end

function batchNormalization2dLayer(
    NumChannels; 
    Epsilon = 1e-05, 
    MeanVarianceDecay = 0.9, 
    ScaleInitializer = "ones", 
    OffsetInitializer = "zeros"
    )
    py"""
    from torch.nn import *
    """
    py"BatchNorm2d"(
    num_features = NumChannels, 
    eps = Epsilon, 
    momentum = MeanVarianceDecay, 
    affine = true, 
    )
end

function batchNormalization3dLayer(
    NumChannels; 
    Epsilon = 1e-05,
    MeanVarianceDecay = 0.9, 
    ScaleInitializer = "ones", 
    OffsetInitializer = "zeros"
    )
    py"""
    from torch.nn import *
    """
    py"BatchNorm3d"(
    num_features = NumChannels, 
    eps = Epsilon,
    momentum = MeanVarianceDecay, 
    affine = true, 
    )
end

function groupNormalizationLayer(
    numGroups, 
    NumChannels; 
    Epsilon = 1e-05, 
    ScaleInitializer = "ones", 
    OffsetInitializer = "zeros"
    )
    py"""
    from torch.nn import *
    """
    py"GroupNorm"(
    num_groups = numGroups, 
    num_channels = NumChannels, 
    eps = Epsilon, 
    affine = true, 
    )
end

function instanceNormalization1dLayer(
    NumChannels; 
    Epsilon = 1e-05, 
    MeanVarianceDecay = 0.1, 
    ScaleInitializer = "ones", 
    OffsetInitializer = "zeros"
    )
    py"""
    from torch.nn import *
    """
    py"InstanceNorm1d"(
    num_features = NumChannels, 
    eps = Epsilon, 
    momentum = MeanVarianceDecay, 
    affine = true, 
    )
end

function instanceNormalization2dLayer(
    NumChannels; 
    Epsilon = 1e-05, 
    MeanVarianceDecay = 0.1, 
    ScaleInitializer = "ones", 
    OffsetInitializer = "zeros"
    )
    py"""
    from torch.nn import *
    """
    py"InstanceNorm2d"(
    num_features = NumChannels, 
    eps = Epsilon, 
    momentum = MeanVarianceDecay, 
    affine = true, 
    )
end

function instanceNormalization3dLayer(
    NumChannels; 
    Epsilon = 1e-05, 
    MeanVarianceDecay = 0.1, 
    ScaleInitializer = "ones", 
    OffsetInitializer = "zeros"
    )
    py"""
    from torch.nn import *
    """
    py"InstanceNorm3d"(
    num_features = NumChannels, 
    eps = Epsilon, 
    momentum = MeanVarianceDecay, 
    affine = true, 
    )
end

function layerNormalizationLayer(
    NumChannels; 
    Epsilon = 1e-07, 
    ScaleInitializer = "ones", 
    OffsetInitializer = "zeros"
    )
    py"""
    from torch.nn import *
    """
    py"LayerNorm"(
    normalized_shape = NumChannels, 
    eps = Epsilon,
    )
end

function crossChannelNormalizationLayer(WindowChannelSize = 5, K = 1.0, Alpha = 1.0, Beta = 0.5)
    py"""
    from torch.nn import *
    """
    py"LocalResponseNorm"(size = WindowChannelSize, k = K, alpha = Alpha, beta = Beta)
end

function dropoutLayer(probability = 0.5)
    py"""
    from torch.nn import *
    """
    py"Dropout"(p = probability)
end

function crop2dLayer(size)
    py"""
    from NetworkLayer_T import *
    """
    py"crop2dLayer"(size = size)
end

function crop3dLayer(size)
    py"""
    from NetworkLayer_T import *
    """
    py"crop3dLayer"(size = size)
end

function averagePooling1dLayer(PoolSize = 1; Stride = 1, PaddingMode = "valid")
    py"""
    from torch.nn import *
    """
    py"AvgPool1d"(kernel_size = PoolSize, stride = Stride)
end

function averagePooling2dLayer(PoolSize = 1; Stride = 1, PaddingMode = "valid")
    py"""
    from torch.nn import *
    """
    py"AvgPool2d"(kernel_size = PoolSize, stride = Stride, )
end

function averagePooling3dLayer(
    PoolSize; 
    Stride = 1, 
    PaddingMode = "valid", 
    Padding = 0, 
    ceil_mode = false, 
    count_include_pad = true, 
    divisor_override = 0)
    py"""
    from torch.nn import *
    """
    py"AvgPool3d"(
    kernel_size = PoolSize, 
    stride = Stride, 
    padding = Padding, 
    ceil_mode = ceil_mode, 
    count_include_pad = count_include_pad, 
    divisor_override = divisor_override
    )
end

function globalAveragePooling1dLayer()
    py"""
    from torch.nn import *
    """
    py"AdaptiveAvgPool1d"(output_size = 1)
end

function globalAveragePooling2dLayer()
    py"""
    from torch.nn import *
    """
    py"AdaptiveAvgPool2d"(output_size = 1)
end

function globalMaxPooling1dLayer()
    py"""
    from torch.nn import *
    """
    py"AdaptiveMaxPool1d"(output_size = 1)
end

function globalMaxPooling2dLayer()
    py"""
    from torch.nn import *
    """
    py"AdaptiveMaxPool2d"(output_size = 1)
end

function globalMaxPooling3dLayer()
    py"""
    from torch.nn import *
    """
    py"AdaptiveMaxPool3d"(output_size = (1, 1, 1))
end

function maxPooling1dLayer(PoolSize = 1; Stride = 1, PaddingMode = "valid")
    py"""
    from torch.nn import *
    """
    py"MaxPool1d"(kernel_size = PoolSize, stride = Stride)
end

function maxPooling2dLayer(PoolSize = 1; Stride = 1, PaddingMode = "valid")
    py"""
    from torch.nn import *
    """
    py"MaxPool2d"( kernel_size = PoolSize, stride = Stride, )
end

function maxPooling3dLayer(PoolSize = 1; Stride = 1, PaddingMode = "valid", Padding = 0)
    py"""
    from torch.nn import *
    """
    py"MaxPool3d"(kernel_size = PoolSize, stride = Stride, padding = Padding)
end

function sigmoidLayer()
    py"""
    from torch.nn import Sigmoid
    """
    py"Sigmoid"()
end

function softmaxLayer(axis = -1)
    py"""
    from torch.nn import Softmax
    """
    py"Softmax"(dim = axis)
end

function Tensor(InputData)
    py"""
    from NetworkLayer_T import Tensor
    """
    py"Tensor"(InputData)
end

function SequentialCell(layers)
    py"""
    from NetworkLayer_T import Sequential
    """
    py"Sequential"(layers)
end

