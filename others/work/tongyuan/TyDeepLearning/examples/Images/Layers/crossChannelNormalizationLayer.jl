using TyDeepLearning
#创建局部响应归一化层
input = rand(Float32, (1, 3, 28, 28))
layers = SequentialCell([
    convolution2dLayer(3, 20, 5),
    reluLayer(),
    crossChannelNormalizationLayer(),
    flattenLayer(),
    fullyConnectedLayer(20 * 28 * 28, 10)
])
print(size(TyDeepLearning.predict(layers, input)))
#创建一个局部响应归一化层和一个数组，使用该层处理数组并输出数组维度。
layer = crossChannelNormalizationLayer()
array = [[[[0.1], [0.2]], [[0.3], [0.4]]]]
print(size(TyDeepLearning.predict(layer, array)))
