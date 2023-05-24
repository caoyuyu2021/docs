using TyDeepLearning
# 创建网络层图并绘制
layers = [
    ("conv1", convolution2dLayer(1, 16, 3)),
    ("batchnorm1", batchNormalization2dLayer(16)),
    ("relu", reluLayer())
]
lgraph = layerGraph(layers)
lgplot(lgraph)
