import mindspore
import mindspore.nn as nn
from Train_M import trainingoptions, trainnetwork

class AutoEncoder(nn.Cell):
    def __init__(self, in_channels, hiddensize):
        super(AutoEncoder,self).__init__()
        self.in_channels = in_channels 
        self.hiddensize = hiddensize
        self.encoder = nn.Dense(in_channels, hiddensize, activation='sigmoid')
        self.decoder = nn.Dense(hiddensize, in_channels, activation='sigmoid')
    def construct(self, x):
        encoded = self.encoder(x)
        decoded = self.decoder(encoded)
        return decoded

def trainSoftmaxLayer(x, t):
    #输入参数设置
    in_channels = x.shape[1]
    hiddensize = 20
    targets =  t.flatten()
    classes_list = targets.tolist()
    classes_set = set(classes_list)
    n_classes = len(classes_set)
    out_channels = n_classes 
    # 网络参数设置
    class trainSoftmaxLayer(nn.Cell):
        def __init__(self, in_channels, hiddensize,out_channels):
            super(trainSoftmaxLayer, self).__init__()
            self.in_channels = in_channels 
            self.hiddensize = hiddensize
            self.out_channels = out_channels
            self.fullyconnect1 = nn.Dense(in_channels, hiddensize, activation='sigmoid')
            self.fullyconnect2 = nn.Dense(hiddensize, out_channels, activation='sigmoid')
            self.softmax  = nn.Softmax()
        def construct(self, x):
            y1 = self.fullyconnect1(x)
            y2 = self.fullyconnect2(y1)
            y = self.softmax(y2)
            return y
    layers = trainSoftmaxLayer(in_channels, hiddensize, out_channels)
    learningrate = 1e-2
    opt = "Adam"
    batchsize = int(x.shape[0]/10)
    epoch = 3000
    loss = "CrossEntropyLoss"
    metrics = "Accuracy"
    #训练
    options = trainingoptions(loss, opt, metrics, batchsize, epoch, learningrate, shuffle=False, verbose=True, plots=False)
    model = trainnetwork(x, t, layers, options)
    return model

def trainAutoencoder(x, hiddensize):
    #输入参数设置
    in_channels = x.shape[1]
    train_data = x
    hiddensize = hiddensize
    #网络参数设置
    class AutoEncoder(nn.Cell):
        def __init__(self, in_channels, hiddensize):
            super(AutoEncoder,self).__init__()
            self.in_channels = in_channels 
            self.hiddensize = hiddensize
            self.encoder = nn.Dense(in_channels, hiddensize, activation='sigmoid')
            self.decoder = nn.Dense(hiddensize, in_channels, activation='sigmoid')
        def construct(self, x):
            encoded = self.encoder(x)
            decoded = self.decoder(encoded)
            return decoded
    layers = AutoEncoder(in_channels, hiddensize)
    learningrate = 1e-3
    opt = "SGD"
    batchsize = int(x.shape[0]/10)
    epoch = 5000
    loss = "MSELoss"
    metrics = "MSE"
    #训练自编码器
    options = trainingoptions(loss, opt, metrics, batchsize, epoch, learningrate, shuffle=False, verbose=True, plots=False)
    model = trainnetwork(train_data, train_data, layers, options)
    return layers

def encode(autoenc, Xnew):
    Xnew = mindspore.Tensor(Xnew, mindspore.float32)
    layers = autoenc.encoder
    return layers(Xnew).asnumpy()

def decode(autoenc, Z):
    Z = mindspore.Tensor(Z, mindspore.float32)
    layers = autoenc.decoder
    return layers(Z).asnumpy()