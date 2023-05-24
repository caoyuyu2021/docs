function lstmLayer(
    InputSize,
    numHiddenUnits;
    NumLayers=1,
    Bias=true,
    Batch_First=false,
    Dropout=0.0,
    Isclassify=false,
)
    py"""
    from NetworkLayer_M import LSTM
    """
    py"LSTM"(;
        input_size=InputSize,
        hidden_size=numHiddenUnits,
        num_layers=NumLayers,
        has_bias=Bias,
        batch_first=Batch_First,
        dropout=Dropout,
        bidirectional=false,
        isclassify=Isclassify,
    )
end

function bilstmLayer(
    InputSize, numHiddenUnits; NumLayers=1, Bias=true, Batch_First=false, Dropout=0.0
)
    py"""
    from NetworkLayer_M import LSTM
    """
    py"LSTM"(;
        input_size=InputSize,
        hidden_size=numHiddenUnits,
        num_layers=NumLayers,
        has_bias=Bias,
        batch_first=Batch_First,
        dropout=Dropout,
        bidirectional=true,
    )
end

function gruLayer(
    InputSize,
    numHiddenUnits;
    NumLayers=1,
    Bias=true,
    Batch_First=false,
    Dropout=0.0,
    Bidirectional=true,
)
    py"""
    from NetworkLayer_M import GRU
    """
    py"GRU"(;
        input_size=InputSize,
        hidden_size=numHiddenUnits,
        num_layers=NumLayers,
        has_bias=Bias,
        batch_first=Batch_First,
        dropout=Dropout,
        bidirectional=Bidirectional,
    )
end

function sequenceUnfoldingLayer(
    kernel_size=(1, 1, 1, 1); Stride=(1, 1, 1, 1), Rates=(1, 1, 1, 1), Pad_mode="valid"
)
    py"""
    from mindspore.nn import Unfold
    """
    py"Unfold"(; ksizes=kernel_size, strides=Stride, rates=Rates, padding=Pad_mode)
end

function flattenLayer()
    py"""
    from mindspore.nn import Flatten
    """
    py"Flatten"()
end
