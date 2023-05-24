import mindspore as ms
from mindspore import ops 
from mindspore import nn
from mindspore import Tensor
import numpy as np
def relu(data):
    fun = ops.ReLU()
    data = ms.Tensor(data, ms.float32)
    return fun(data).asnumpy()

def lstm(X, H0, C0, weights, Bias= True, Bidirectional = False, Dropout =0.0):
    _, batch_size, input_size = X.shape
    num_layers,_,hidden_size = H0.shape
    input_tensor = Tensor(X.astype(np.float32))
    h0 = Tensor(H0.astype(np.float32))
    c0 = Tensor(C0.astype(np.float32))
    w = Tensor(weights.astype(np.float32))
    net = ops.LSTM(input_size,hidden_size,num_layers,Bias,Bidirectional, Dropout)
    output, hn, cn, _, _ = net(input_tensor, h0, c0, w)
    return output.asnumpy()

def dlconv(X, Weights):
    out_channel, in_channel,kernel_size1, kernel_size2 = Weights.shape
    conv2d = ops.Conv2D(out_channel, (kernel_size1, kernel_size2))
    x = Tensor(X, ms.float32)
    weight = Tensor(Weights, ms.float32)
    output = conv2d(x,weight)
    return output.asnumpy()

def dltranspconv(X,Weights):
    batch_size,out_channel,out_height, out_width = X.shape
    out_channel, in_channel,kernel_size1,kernel_size2 = Weights.shape
    conv2d_transpose_input = ops.Conv2DTranspose(out_channel, (kernel_size1, kernel_size2))
    dout = Tensor(X, ms.float32)
    weight = Tensor(Weights, ms.float32)
    in_height = out_height+kernel_size1-1
    in_width = out_width+kernel_size2-1
    output = conv2d_transpose_input(dout, weight, (batch_size, out_channel, in_height, in_width))
    return output.asnumpy()

def LRN(X):
    x = Tensor(X, ms.float32)
    lrn = ops.LRN()
    output = lrn(x)
    return output.asnumpy()

def LayerNorm(X, offset, scaleFactor):
    x = Tensor(X, ms.float32)
    gamma = Tensor(scaleFactor, ms.float32)
    beta = Tensor(offset, ms.float32)
    layer_norm = ops.LayerNorm()
    output, mean, variance = layer_norm(x, gamma, beta)
    return output.asnumpy()

def AvgPool(X, kernel_size , strides, pad_mode):
    layer = ops.AvgPool(kernel_size , strides, pad_mode)
    x = Tensor(X, ms.float32)
    output = layer(x)
    return output.asnumpy()

def Softmax(X):
    fun = ops.Softmax()
    x = ms.Tensor(X, ms.float32)
    return fun(x).asnumpy()

def Sigmoid(X):
    fun = ops.Sigmoid()
    x = ms.Tensor(X, ms.float32)
    return fun(x).asnumpy()

def CrossEntropy(X, targets, weights = None):
    x = ms.Tensor(X, ms.float32)
    labels = ms.Tensor(targets, ms.int32)
    weight = ms.Tensor(weights, ms.float32)
    output = ops.cross_entropy(x, labels, weight)
    return output.asnumpy()

# def gru(X,H0,Weights, Bias, Dropout = 0.0):
#     seq_len, batch_size, input_size = X.shape
#     input_size ,hidden_size = H0.shape
#     input_tensor = Tensor(X.astype(np.float16))
#     h0 = Tensor(H0.astype(np.float16))
#     w = Tensor(Weights.astype(np.float16))
#     bias_i = Tensor(Bias[0].astype(np.float16))
#     bias_h = Tensor(Bias[1].astype(np.float16))
#     init_h =  Tensor(np.random.rand(batch_size, hidden_size//3).astype(np.float16))
#     net = ops.DynamicGRUV2()
#     output, hn, cn, _, _ ,_= net(input_tensor, w , h0, bias_i, bias_h, None, init_h)
#     return output.asnumpy()

def Dense(X,Weights, Bias):
    _, in_channel = X.shape
    out_channel,_ = Weights.shape
    x = Tensor(X, ms.float32)
    w= Tensor(Weights, ms.float32)
    bias = Tensor(Bias, ms.float32)
    net = nn.Dense(in_channel, out_channel, w, bias)
    output = net(x)
    return output.asnumpy()

def LeakyReLU(X, scaleFactor = 0.2):
    fun = nn.LeakyReLU(scaleFactor)
    x = ms.Tensor(X, ms.float32)
    return fun(x).asnumpy()

def BatchNorm(X,offset,scaleFactor,trainedMu,trainedSigmaSq):
    batch_norm = ops.BatchNorm()
    x = Tensor(X, ms.float32)
    scale = Tensor(scaleFactor, ms.float32)
    bias  = Tensor(offset, ms.float32)
    mean = Tensor(trainedMu, ms.float32)
    variance = Tensor(trainedSigmaSq, ms.float32)
    output = batch_norm(x, scale, bias, mean, variance)
    return output[0].asnumpy()

def GroupNorm(X,numGroups,offset,scaleFactor):
    _,num_channels,_,_ = X.shape
    gamma = Tensor(scaleFactor, ms.float32)
    beta = Tensor(offset, ms.float32)
    net = nn.GroupNorm(numGroups, num_channels, gamma_init = gamma, beta_init = beta)
    x = Tensor(X, ms.float32)
    output = net(x)
    return output.asnumpy()

# def InstanceNorm(X,offset,scaleFactor):
#     gamma = Tensor(scaleFactor, ms.float32)
#     beta = Tensor(offset, ms.float32)
#     x = Tensor(X, ms.float32)
#     if len(X.shape) == 3:
#         _, num_features,_ = X.shape
#         net = nn.InstanceNorm1d(num_features, gamma_init = gamma, beta_init = beta)
#     elif len(X.shape) == 4:
#         _, num_features,_ ,_= X.shape
#         net = nn.InstanceNorm2d(num_features, gamma_init = gamma, beta_init = beta)
#     elif len(X.shape) == 5:
#         _, num_features,_,_ ,_= X.shape
#         net = nn.InstanceNorm3d(num_features, gamma_init = gamma, beta_init = beta)
#     output = net(x)
#     return output.asnumpy()
 
def MaxPool(X, poolsize = 1, strides = 1, pad_mode = "valid"):
    x = Tensor(X, ms.float32)
    maxpool_op = ops.MaxPool(poolsize, strides, pad_mode)
    output = maxpool_op(x)
    return output.asnumpy()

def Huber(Y, targets):
    loss = nn.HuberLoss(reduction = "none")
    logits = Tensor(Y, ms.float32)
    labels = Tensor(targets, ms.float32)
    output = loss(logits, labels)
    return output.asnumpy()

def MSE(Y,targets):
    y = Tensor(Y, ms.float32)
    t = Tensor(targets, ms.float32)
    error = nn.MSE()
    error.clear()
    error.update(y, t)
    result = error.eval()
    return result

def Accuracy(X, Y):
    x = Tensor(X, ms.float32)
    y = Tensor(Y, ms.float32)
    metric = nn.Accuracy('classification')
    metric.clear()
    metric.update(x, y)
    accuracy = metric.eval()
    return accuracy





    
    



    






