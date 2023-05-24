using TyDeepLearning
# 替代图层中的层
layers = [
    ("conv1", convolution2dLayer(1, 16, 3)),
    ("relu1", reluLayer()),
    ("fullconnect", fullyConnectedLayer(16, 2)),
    ("softmax", softmaxLayer())
]
lgraph = layerGraph(layers)
lgplot(lgraph)

layers2 = [
    ("batchnorm1", batchNormalization2dLayer(16)), 
    ("leakyrelu1", leakyReluLayer())
]
lgraph = replaceLayer(lgraph, "relu1", layers2)
lgplot(lgraph)
