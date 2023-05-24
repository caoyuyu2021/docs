using TyDeepLearning
#创建网络图层并比较其相等性

layers1 = [
    ("conv1", convolution2dLayer(1, 16, 3)), 
    ("batchnorm1", batchNormalization2dLayer(16))
]
layers2 = [
    ("conv1", convolution2dLayer(1, 16, 3)), 
    ("batchnorm1", batchNormalization2dLayer(16))
]
layers3 = [
    ("conv1", convolution2dLayer(1, 16, 3)),
    ("batchnorm1", batchNormalization2dLayer(16)),
     ("relu", reluLayer())
]
net1 = layerGraph(layers1)
net2 = layerGraph(layers2)
net3 = layerGraph(layers3)

println(TyDeepLearning.isequal(net1, net2))
println(TyDeepLearning.isequal(net2, net3))
