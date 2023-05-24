function convolution1dLayer(
    NumChannels,
    NumFilters,
    FilterSize;
    Stride=1,
    PaddingMode="same",
    PaddingSize=0,
    DilationFactor=1,
    Bias=false,
    WeightsInitializer="normal",
    BiasInitializer="zeros",
)
    py"""
    from mindspore.nn import Conv1d
    """
    py"Conv1d"(;
        in_channels=NumChannels,
        out_channels=NumFilters,
        kernel_size=FilterSize,
        stride=Stride,
        pad_mode=PaddingMode,
        padding=PaddingSize,
        dilation=DilationFactor,
        group=1,
        has_bias=Bias,
        weight_init=WeightsInitializer,
        bias_init=BiasInitializer,
    )
end

function convolution2dLayer(
    NumChannels,
    NumFilters,
    FilterSize;
    Stride=1,
    PaddingMode="same",
    PaddingSize=0,
    DilationFactor=1,
    Bias=false,
    WeightsInitializer="normal",
    BiasInitializer="zeros",
)
    py"""
    from mindspore.nn import Conv2d
    """
    py"Conv2d"(;
        in_channels=NumChannels,
        out_channels=NumFilters,
        kernel_size=FilterSize,
        stride=Stride,
        pad_mode=PaddingMode,
        padding=PaddingSize,
        dilation=DilationFactor,
        group=1,
        has_bias=Bias,
        weight_init=WeightsInitializer,
        bias_init=BiasInitializer,
    )
end

function convolution3dLayer(
    NumChannels,
    NumFilters,
    FilterSize;
    Stride=1,
    PaddingMode="same",
    PaddingSize=0,
    DilationFactor=1,
    Bias=false,
    WeightsInitializer="normal",
    BiasInitializer="zeros",
)
    py"""
    from mindspore.nn import Conv3d
    """
    py"Conv3d"(;
        in_channels=NumChannels,
        out_channels=NumFilters,
        kernel_size=FilterSize,
        stride=Stride,
        pad_mode=PaddingMode,
        padding=PaddingSize,
        dilation=DilationFactor,
        group=1,
        has_bias=Bias,
        weight_init=WeightsInitializer,
        bias_init=BiasInitializer,
    )
end

function groupedConvolution2dLayer(
    NumChannelsPerGroup,
    NumFiltersPerGroup,
    FilterSize,
    NumGroups;
    Stride=1,
    PaddingMode="same",
    PaddingSize=0,
    DilationFactor=1,
    Bias=false,
    WeightsInitializer="normal",
    BiasInitializer="zeros",
)
    py"""
    from mindspore.nn import Conv2d
    """
    py"Conv2d"(;
        in_channels=NumChannelsPerGroup,
        out_channels=NumFiltersPerGroup,
        kernel_size=FilterSize,
        stride=Stride,
        pad_mode=PaddingMode,
        padding=PaddingSize,
        dilation=DilationFactor,
        group=NumGroups,
        has_bias=Bias,
        weight_init=WeightsInitializer,
        bias_init=BiasInitializer,
    )
end

function transposedConv1dLayer(
    NumChannels,
    NumFilters,
    FilterSize;
    Stride=1,
    PaddingMode="same",
    PaddingSize=0,
    DilationFactor=1,
    Bias=false,
    WeightsInitializer="normal",
    BiasInitializer="zeros",
)
    py"""
    from mindspore.nn import Conv1dTranspose
    """
    py"Conv1dTranspose"(;
        in_channels=NumChannels,
        out_channels=NumFilters,
        kernel_size=FilterSize,
        stride=Stride,
        pad_mode=PaddingMode,
        padding=PaddingSize,
        dilation=DilationFactor,
        group=1,
        has_bias=Bias,
        weight_init=WeightsInitializer,
        bias_init=BiasInitializer,
    )
end

function transposedConv2dLayer(
    NumChannels,
    NumFilters,
    FilterSize;
    Stride=1,
    PaddingMode="same",
    PaddingSize=0,
    DilationFactor=1,
    Bias=false,
    WeightsInitializer="normal",
    BiasInitializer="zeros",
)
    py"""
    from mindspore.nn import Conv2dTranspose
    """
    py"Conv2dTranspose"(;
        in_channels=NumChannels,
        out_channels=NumFilters,
        kernel_size=FilterSize,
        stride=Stride,
        pad_mode=PaddingMode,
        padding=PaddingSize,
        dilation=DilationFactor,
        group=1,
        has_bias=Bias,
        weight_init=WeightsInitializer,
        bias_init=BiasInitializer,
    )
end

function transposedConv3dLayer(
    NumChannels,
    NumFilters,
    FilterSize;
    Stride=1,
    PaddingMode="same",
    PaddingSize=0,
    DilationFactor=1,
    Bias=false,
    WeightsInitializer="normal",
    BiasInitializer="zeros",
)
    py"""
    from mindspore.nn import Conv3dTranspose
    """
    py"Conv3dTranspose"(;
        in_channels=NumChannels,
        out_channels=NumFilters,
        kernel_size=FilterSize,
        stride=Stride,
        pad_mode=PaddingMode,
        padding=PaddingSize,
        dilation=DilationFactor,
        group=1,
        output_padding=0,
        has_bias=Bias,
        weight_init=WeightsInitializer,
        bias_init=BiasInitializer,
    )
end

function fullyConnectedLayer(
    InputSize, OutputSize; WeightsInitializer="normal", BiasInitializer="zeros", Bias=true
)
    py"""
    from mindspore.nn import Dense
    """
    py"Dense"(;
        in_channels=InputSize,
        out_channels=OutputSize,
        weight_init=WeightsInitializer,
        bias_init=BiasInitializer,
        has_bias=Bias,
    )
end

function reluLayer()
    py"""
    from mindspore.nn import ReLU
    """
    py"ReLU"()
end

function leakyReluLayer(scale=0.2)
    py"""
    from mindspore.nn import LeakyReLU
    """
    py"LeakyReLU"(; alpha=scale)
end

function clippedReluLayer()
    py"""
    from mindspore.nn import ReLU6
    """
    py"ReLU6"()
end

function eluLayer(alpha=1.0)
    py"""
    from mindspore.nn import ELU
    """
    py"ELU"(; alpha=alpha)
end

function tanhLayer()
    py"""
    from mindspore.nn import Tanh
    """
    py"Tanh"()
end

function swishLayer()
    py"""
    from NetworkLayer_M import Swish
    """
    py"Swish"()
end

function batchNormalization1dLayer(
    NumChannels;
    Epsilon=1e-05,
    MeanVarianceDecay=0.9,
    ScaleInitializer="ones",
    OffsetInitializer="zeros",
)
    py"""
    from mindspore.nn import BatchNorm1d
    """
    py"BatchNorm1d"(;
        num_features=NumChannels,
        eps=Epsilon,
        momentum=MeanVarianceDecay,
        affine=true,
        gamma_init=ScaleInitializer,
        beta_init=OffsetInitializer,
        moving_mean_init="zeros",
        moving_var_init="ones",
    )
end

function batchNormalization2dLayer(
    NumChannels;
    Epsilon=1e-05,
    MeanVarianceDecay=0.9,
    ScaleInitializer="ones",
    OffsetInitializer="zeros",
)
    py"""
    from mindspore.nn import BatchNorm2d
    """
    py"BatchNorm2d"(;
        num_features=NumChannels,
        eps=Epsilon,
        momentum=MeanVarianceDecay,
        affine=true,
        gamma_init=ScaleInitializer,
        beta_init=OffsetInitializer,
        moving_mean_init="zeros",
        moving_var_init="ones",
    )
end

function batchNormalization3dLayer(
    NumChannels;
    Epsilon=1e-05,
    MeanVarianceDecay=0.9,
    ScaleInitializer="ones",
    OffsetInitializer="zeros",
)
    py"""
    from mindspore.nn import BatchNorm3d
    """
    py"BatchNorm3d"(;
        num_features=NumChannels,
        eps=Epsilon,
        momentum=MeanVarianceDecay,
        affine=true,
        gamma_init=ScaleInitializer,
        beta_init=OffsetInitializer,
        moving_mean_init="zeros",
        moving_var_init="ones",
    )
end

function groupNormalizationLayer(
    numGroups,
    NumChannels;
    Epsilon=1e-05,
    ScaleInitializer="ones",
    OffsetInitializer="zeros",
)
    py"""
    from mindspore.nn import GroupNorm
    """
    py"GroupNorm"(;
        num_groups=numGroups,
        num_channels=NumChannels,
        eps=Epsilon,
        affine=true,
        gamma_init=ScaleInitializer,
        beta_init=OffsetInitializer,
    )
end

function instanceNormalization1dLayer(
    NumChannels;
    Epsilon=1e-05,
    MeanVarianceDecay=0.1,
    ScaleInitializer="ones",
    OffsetInitializer="zeros",
)
    py"""
    from mindspore.nn import InstanceNorm1d
    """
    py"InstanceNorm1d"(;
        num_features=NumChannels,
        eps=Epsilon,
        momentum=MeanVarianceDecay,
        affine=true,
        gamma_init=ScaleInitializer,
        beta_init=OffsetInitializer,
    )
end

function instanceNormalization2dLayer(
    NumChannels;
    Epsilon=1e-05,
    MeanVarianceDecay=0.1,
    ScaleInitializer="ones",
    OffsetInitializer="zeros",
)
    py"""
    from mindspore.nn import InstanceNorm2d
    """
    py"InstanceNorm2d"(;
        num_features=NumChannels,
        eps=Epsilon,
        momentum=MeanVarianceDecay,
        affine=true,
        gamma_init=ScaleInitializer,
        beta_init=OffsetInitializer,
    )
end

function instanceNormalization3dLayer(
    NumChannels;
    Epsilon=1e-05,
    MeanVarianceDecay=0.1,
    ScaleInitializer="ones",
    OffsetInitializer="zeros",
)
    py"""
    from mindspore.nn import InstanceNorm3d
    """
    py"InstanceNorm3d"(;
        num_features=NumChannels,
        eps=Epsilon,
        momentum=MeanVarianceDecay,
        affine=true,
        gamma_init=ScaleInitializer,
        beta_init=OffsetInitializer,
    )
end

function layerNormalizationLayer(
    NumChannels; Epsilon=1e-07, ScaleInitializer="ones", OffsetInitializer="zeros"
)
    py"""
    from mindspore.nn import LayerNorm
    """
    py"LayerNorm"(;
        normalized_shape=NumChannels,
        begin_norm_axis=1,
        begin_params_axis=1,
        gamma_init=ScaleInitializer,
        beta_init=OffsetInitializer,
        epsilon=Epsilon,
    )
end

function crossChannelNormalizationLayer(WindowChannelSize=5, K=1.0, Alpha=1.0, Beta=0.5)
    py"""
    from mindspore.nn import LRN
    """
    py"LRN"(; depth_radius=WindowChannelSize, bias=K, alpha=Alpha, beta=Beta)
end

function dropoutLayer(probability=0.5)
    py"""
    from NetworkLayer_M import DropoutLayer
    """
    py"DropoutLayer"(probability)
end

function crop2dLayer(size)
    py"""
    from mindspore.nn import CentralCrop
    """
    py"CentralCrop"(; central_fraction=size)
end

function crop3dLayer(size)
    py"""
    from mindspore.nn import CentralCrop
    """
    py"CentralCrop"(; central_fraction=size)
end

function averagePooling1dLayer(PoolSize=1; Stride=1, PaddingMode="valid")
    py"""
    from mindspore.nn import AvgPool1d
    """
    py"AvgPool1d"(; kernel_size=PoolSize, stride=Stride, pad_mode=PaddingMode)
end

function averagePooling2dLayer(PoolSize=1; Stride=1, PaddingMode="valid")
    py"""
    from mindspore.nn import AvgPool2d
    """
    py"AvgPool2d"(; kernel_size=PoolSize, stride=Stride, pad_mode=PaddingMode)
end

function averagePooling3dLayer(
    PoolSize;
    Stride=1,
    PaddingMode="valid",
    Padding=0,
    ceil_mode=false,
    count_include_pad=true,
    divisor_override=0,
)
    py"""
    from NetworkLayer_M import AvgPool3d
    """
    py"AvgPool3d"(;
        kernel_size=PoolSize,
        stride=Stride,
        pad_mode=PaddingMode,
        pad=Padding,
        ceil_mode=ceil_mode,
        count_include_pad=count_include_pad,
        divisor_override=divisor_override,
    )
end

function globalAveragePooling1dLayer()
    py"""
    from mindspore.nn import AdaptiveAvgPool1d
    """
    py"AdaptiveAvgPool1d"(; output_size=1)
end

function globalAveragePooling2dLayer()
    py"""
    from mindspore.nn import AdaptiveAvgPool2d
    """
    py"AdaptiveAvgPool2d"(; output_size=1)
end

function globalMaxPooling1dLayer()
    py"""
    from mindspore.nn import AdaptiveMaxPool1d
    """
    py"AdaptiveMaxPool1d"(; output_size=1)
end

function globalMaxPooling2dLayer()
    py"""
    from mindspore.nn import AdaptiveMaxPool2d
    """
    py"AdaptiveMaxPool2d"(; output_size=1)
end

function globalMaxPooling3dLayer()
    py"""
    from NetworkLayer_M import AdaptiveMaxPool3d
    """
    py"AdaptiveMaxPool3d"(; output_size=(1, 1, 1))
end

function maxPooling1dLayer(PoolSize=1; Stride=1, PaddingMode="valid")
    py"""
    from mindspore.nn import MaxPool1d
    """
    py"MaxPool1d"(; kernel_size=PoolSize, stride=Stride, pad_mode=PaddingMode)
end

function maxPooling2dLayer(PoolSize=1; Stride=1, PaddingMode="valid")
    py"""
    from mindspore.nn import MaxPool2d
    """
    py"MaxPool2d"(; kernel_size=PoolSize, stride=Stride, pad_mode=PaddingMode)
end

function maxPooling3dLayer(PoolSize=1; Stride=1, PaddingMode="valid", Padding=0)
    py"""
    from NetworkLayer_M import MaxPool3d
    """
    py"MaxPool3d"(; kernel_size=PoolSize, stride=Stride, pad_mode=PaddingMode, pad=Padding)
end

function sigmoidLayer()
    py"""
    from mindspore.nn import Sigmoid
    """
    py"Sigmoid"()
end

function softmaxLayer(axis=-1)
    py"""
    from mindspore.nn import Softmax
    """
    py"Softmax"(; axis=axis)
end

function Tensor(InputData)
    py"""
    from mindspore import Tensor
    """
    py"Tensor"(InputData)
end

function SequentialCell(layers)
    py"""
    from NetworkLayer_M import SequentialCell
    """
    py"SequentialCell"(layers)
end
