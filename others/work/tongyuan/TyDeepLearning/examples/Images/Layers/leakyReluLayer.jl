using TyDeepLearning
#创建一个Leaky ReLU激活函数层。
#创建一个数组，使用该层处理数组并输出结果。
layer = leakyReluLayer(0.1)
array = Array{Float32}[[-1.0, 4.0, -8.0], [2.0, -5.0, 9.0]]
print(TyDeepLearning.predict(layer, array))

#创建Leaky ReLU激活函数层
input = rand(Float32, (1, 1, 28, 28))
layers = SequentialCell([
    convolution2dLayer(1, 16, 3),
    batchNormalization2dLayer(16),
    leakyReluLayer(0.1),
    maxPooling2dLayer(2; Stride=2),
    convolution2dLayer(16, 32, 3),
    batchNormalization2dLayer(32),
    leakyReluLayer(0.1),
    flattenLayer(),
    fullyConnectedLayer(32 * 14 * 14, 10),
    softmaxLayer()
])
print(size(TyDeepLearning.predict(layers, input)))
