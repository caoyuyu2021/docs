using TyDeepLearning
#创建组归一化层
layer = groupNormalizationLayer(3, 3)
input = rand(Float32, (1, 3, 28, 28))
layers = SequentialCell([
    convolution2dLayer(3, 20, 5),
    groupNormalizationLayer(4, 20),
    reluLayer(),
    maxPooling2dLayer(2; Stride=2),
    flattenLayer(),
    fullyConnectedLayer(20 * 14 * 14, 10),
    softmaxLayer()
])
println(size(TyDeepLearning.predict(layers, input)))
#创建一个组归一化层，划分组数和通道数为2。
#创建一个维度为（1，2，4，4）、元素均为1的数组，使用该层处理数组并输出结果。
layer = groupNormalizationLayer(2, 2)
array = ones(Float32, (1, 2, 4, 4))
println(size(TyDeepLearning.predict(layer, array)))
