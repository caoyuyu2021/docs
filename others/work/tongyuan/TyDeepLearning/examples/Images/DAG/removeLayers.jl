# 从图层中移出层
layers = [
    ("conv1", convolution2dLayer(1, 16, 3)),
    ("batchnorm1", batchNormalization2dLayer(16)),
    ("relu", reluLayer())
]
lgraph = layerGraph(layers)
lgplot(lgraph)

lgraph = removeLayers(lgraph, "batchnorm1")
lgplot(lgraph)
