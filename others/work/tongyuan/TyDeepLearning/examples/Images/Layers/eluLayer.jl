using TyDeepLearning
#创建指数线性单元激活函数层。
input = rand(Float32, (1, 1, 28, 28))
layers = SequentialCell([
    convolution2dLayer(1, 16, 3),
    batchNormalization2dLayer(16),
    eluLayer(),
    maxPooling2dLayer(2; Stride=2),
    convolution2dLayer(16, 32, 3),
    batchNormalization2dLayer(32),
    eluLayer(),
    flattenLayer(),
    fullyConnectedLayer(32 * 14 * 14, 10),
    softmaxLayer()
])
print(size(TyDeepLearning.predict(layers, input)))
#创建一个指数线性单元激活函数层。
#创建一个数组，使用该层处理数组并输出结果。
layer = eluLayer()
array = convert(Array{Float32}, [-1, -2, 0, 2, 1])
print(TyDeepLearning.predict(layer, array))
