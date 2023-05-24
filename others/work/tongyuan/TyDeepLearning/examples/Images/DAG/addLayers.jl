# 创建一个层和一个图层，将层添加到图层并绘制图层图
using TyDeepLearning

layers = [
    ("conv1", convolution2dLayer(1, 16, 3)), 
    ("batchnorm1", batchNormalization2dLayer(16))
]
lgraph = layerGraph(layers)
lgplot(lgraph)

layer_add = [("relu", reluLayer())]
lgraph = addLayers(lgraph, layer_add)
lgplot(lgraph)
