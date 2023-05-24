using TyDeepLearning
#创建随机丢弃层
input = rand(Float32, (1, 1, 28, 28))
layers = SequentialCell([
    convolution2dLayer(1, 20, 5),
    reluLayer(),
    dropoutLayer(0.5),
    flattenLayer(),
    fullyConnectedLayer(20 * 28 * 28, 10),
    softmaxLayer()
])
print(size(TyDeepLearning.predict(layers, input)))
#创建一个随机丢弃层，输入神经元丢弃率为0.2。
#创建一个维度为（2，2，3）、元素均为1的数组，使用该层处理数组并输出结果维度。
layer = dropoutLayer(0.2)
array = ones(Float32, (2, 2, 3))
print(size(TyDeepLearning.predict(layer, array)))
