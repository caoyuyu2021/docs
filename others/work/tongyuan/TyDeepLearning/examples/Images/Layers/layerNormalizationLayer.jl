using TyDeepLearning
#创建层归一化层
input = rand(Float32, (1, 3, 32, 32))
layers = SequentialCell([
    convolution2dLayer(3, 16, 3; Stride=1, PaddingMode="pad", PaddingSize=1),
    layerNormalizationLayer((16, 32, 32)),
    reluLayer(),
    maxPooling2dLayer(2; Stride=2),
    convolution2dLayer(16, 32, 3; Stride=1, PaddingMode="pad", PaddingSize=1),
    layerNormalizationLayer((32, 16, 16)),
    reluLayer(),
    flattenLayer(),
    fullyConnectedLayer(32 * 16 * 16, 10),
    softmaxLayer()
])
print(size(TyDeepLearning.predict(layers, input)))
#创建一个维度为（20，5，10，10）、元素均为1的数组，使用该层处理数组并输出结果维度。
array = ones(Float32, (20, 5, 10, 10))
layer = layerNormalizationLayer((5, 10, 10))
print(size(TyDeepLearning.predict(layer, array)))
