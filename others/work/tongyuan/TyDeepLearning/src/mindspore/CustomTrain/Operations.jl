function dlconv(X, Weights)
    py"""
    from Operations_M import dlconv
    """
    py"dlconv"(X, Weights)
end

function dltranspconv(X, Weights)
    py"""
  from Operations_M import dltranspconv
  """
    py"dltranspconv"(X, Weights)
end

function lstm(X, H0, C0, Weights; Bias=true, Bidirectional=false, Dropout=0.0)
    py"""
  from Operations_M import lstm
  """
    py"lstm"(X, H0, C0, Weights, Bias, Bidirectional, Dropout)
end

function fullyconnect(X, Weights, Bias)
    py"""
    from Operations_M import Dense
    """
    py"Dense"(X, Weights, Bias)
end

function relu(data)
    py"""
    from Operations_M import relu
    """
    py"relu"(data)
end

function leakyrelu(X, scaleFactor=0.2)
    py"""
    from Operations_M import LeakyReLU
    """
    py"LeakyReLU"(X, scaleFactor)
end

function batchnorm(X, offset, scaleFactor, trainedMu, trainedSigmaSq)
    py"""
    from Operations_M import BatchNorm
    """
    py"BatchNorm"(X, offset, scaleFactor, trainedMu, trainedSigmaSq)
end

function crosschannelnorm(X)
    py"""
    from Operations_M import LRN
    """
    py"LRN"(X)
end

function groupnorm(X, numGroups, offset, scaleFactor)
    py"""
    from Operations_M import GroupNorm
    """
    py"GroupNorm"(X, numGroups, offset, scaleFactor)
end

function layernorm(X, offset, scaleFactor)
    py"""
      from Operations_M import LayerNorm
      """
    py"LayerNorm"(X, scaleFactor, offset)
end

function avgpool(X, poolsize; Stride=1, PaddingMode="valid")
    py"""
    from Operations_M import AvgPool
    """
    py"AvgPool"(X; kernel_size=poolsize, strides=Stride, pad_mode=PaddingMode)
end

function maxpool(X, poolsize; Stride=1, PaddingMode="valid")
    py"""
    from Operations_M import MaxPool
     """
    py"MaxPool"(X, poolsize; strides=Stride, pad_mode=PaddingMode)
end

function softmax(X)
    py"""
    from Operations_M import Softmax
    """
    py"Softmax"(X)
end

function sigmoid(X)
    py"""
    from Operations_M import Sigmoid
    """
    py"Sigmoid"(X)
end

function crossentropy(X, targets, weight=nothing)
    py"""
    from Operations_M import CrossEntropy
    """
    py"CrossEntropy"(X, targets, weight)
end

function huber(Y, targets)
    py"""
    from Operations_M import Huber
    """
    py"Huber"(Y, targets)
end

function mse(Y, targets)
    py"""
    from Operations_M import MSE
    """
    py"MSE"(Y, targets)
end

function Accuracy(X, Y)
    py"""
    from Operations_M import Accuracy
    """
    py"Accuracy"(X, Y)
end
