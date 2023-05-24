using TyDeepLearning
#创建二维全局最大池化层
layer = globalMaxPooling2dLayer()
input = rand(Float32, (1, 1, 28, 28))
layers = SequentialCell([
    convolution2dLayer(1, 20, 5),
    reluLayer(),
    globalMaxPooling2dLayer(),
    flattenLayer(),
    fullyConnectedLayer(20, 10),
    softmaxLayer()
])
print(size(TyDeepLearning.predict(layers, input)))
#创建一个二维全局最大池化层。
#创建一个数组，使用该层处理数组并输出结果。
layer = globalMaxPooling2dLayer()
array = [
    [[1.0, 2.0, 3.0], [4.0, 5.0, 6.0], [7.0, 8.0, 9.0]],
    [[1.0, 2.0, 3.0], [4.0, 5.0, 6.0], [7.0, 8.0, 9.0]],
    [[1.0, 2.0, 3.0], [4.0, 5.0, 6.0], [7.0, 8.0, 9.0]],
]
print(TyDeepLearning.predict(layer, array))
print(size(TyDeepLearning.predict(layer, array)))
