function Sequential(layers)
    py"""
    from networklayer_python import *
    """
    py"Sequential"(layers)
end

function lstmLayer(numHiddenUnits, inputsize = 100)
    py"""
    from networklayer_python import *
    """
    py"LSTMLayer"(inputsize = inputsize, hidden_size = numHiddenUnits)
end

function bilstmLayer(numHiddenUnits, inputsize = 100)
    py"""
    from networklayer_python import *
    """
    py"LSTMLayer"(input_size = inputsize, hidden_size = numHiddenUnits, bidirectional = true)
end

function gruLayer(numHiddenUnits, inputsize = 100)
    py"""
    from torch.nn import *
    """
    py"GRU"(input_size = inputsize, hidden_size = numHiddenUnits)
end

function flattenLayer(start_dim = 1, end_dim = -1)
    py"""
    from torch.nn import *
    """
    py"Flatten"(start_dim = start_dim, end_dim = end_dim)
end

function fullyConnectedLayer(outputsize, inputsize = 100, bias = true)
    py"""
    from torch.nn import *
    """
    py"Linear"(inputsize, outputsize, bias = bias)
end

function reluLayer(inplace = false)
    py"""
    from torch.nn import *
    """
    py"ReLU"(inplace = inplace)
end

function leakyReluLayer(negative_slope = 0.01, inplace = false)
    py"""
    from torch.nn import *
    """
    py"LeakyReLU"(negative_slope = negative_slope, inplace = inplace)
end

function eluLayer(alpha = 1.0, inplace = false)
    py"""
    from torch.nn import *
    """
    py"ELU"(alpha = alpha, inplace = inplace)
end

function tanhLayer()
    py"""
    from torch.nn import *
    """
    py"Tanh"()
end

function dropoutLayer(p = 0.5, inplace = false)
    py"""
    from torch.nn import *
    """
    py"Dropout"(p = p, inplace = inplace)
end


function softmaxLayer(dim = 0)
    py"""
    from torch.nn import *
    """
    py"Softmax"(dim = dim)
end

function sigmoidLayer()
    py"""
    from torch.nn import *
    """
    py"Sigmoid"()
end

function sequenceFoldingLayer(output_size, kernel_size, dilation = 1, padding = 0, stride = 1)
    py"""
    from torch.nn import *
    """
    py"Fold"(output_size = output_size, kernel_size = kernel_size, dilation = dilation, padding = padding, stride = stride)
end

function sequenceUnfoldingLayer(kernel_size, dilation = 1, padding = 0, stride = 1)
    py"""
    from torch.nn import *
    """
    py"Unfold"(kernel_size = kernel_size, dilation = dilation, padding = padding, stride = stride)
end

function swishLayer(inplace = false)
    py"""
    from networklayer_python import *
    """
    py"Swish"(inplace = inplace)
end

function clippedReluLayer(ceiling)
    py"""
    from networklayer_python import *
    """
    py"Clipedrule"(ceiling)
end

function sequenceInputLayer(inputsize)
    py"""
    from networklayer_python import *
    """
    py"SequenceInput"(inputsize)
end

function featureInputLayer(inputsize)
    py"""
    from networklayer_python import *
    """
    py"featureInputLayer"(inputsize)
end


function japaneseVowelsTrainData()
    py"""
    from networklayer_python import *
    """
    py"japaneseVowelsTrainData"()
end

function japaneseVowelsTestData()
    py"""
    from networklayer_python import *
    """
    py"japaneseVowelsTestData"()
end




