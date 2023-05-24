using TyDeepLearning
#创建swish激活函数层
array = rand(Float32, (1, 1, 28, 28))
layers = SequentialCell([
    convolution2dLayer(1, 20, 5),
    batchNormalization2dLayer(20),
    swishLayer(),
    maxPooling2dLayer(2; Stride=2),
    flattenLayer(),
    fullyConnectedLayer(20 * 14 * 14, 10),
    softmaxLayer()
])
print(size(TyDeepLearning.predict(layers, array)))
