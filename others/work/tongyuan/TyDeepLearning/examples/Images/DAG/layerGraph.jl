# 创建网络图层
using TyDeepLearning
numchannels = 1
numfilters = 16
filtersize = (3, 3)
layers = [
    ("conv1", convolution2dLayer(1, 16, 3)),
    ("batchnorm1", batchNormalization2dLayer(16)),
    ("relu", reluLayer())
]
lgraph = layerGraph(layers)
