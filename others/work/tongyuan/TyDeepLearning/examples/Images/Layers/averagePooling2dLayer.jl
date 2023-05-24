using TyDeepLearning
#创建二维平均池化层，池化核尺寸为3，移动步长为1
#随机生成维度为（1，2，4，4）的数组
#使用该层处理数组并输出数组维度。
pool = averagePooling2dLayer(3; Stride = 1)
array = rand(Float16, (1, 2, 4, 4))
println(size(TyDeepLearning.predict(pool, array)))

#创建一个包括二维平均池化层的神经网络；
#随机生成一个维度为 (1,1,28,28) 的数组，使用该神经网络处理并输出数组维度
input = rand(Float32, (1, 1, 28, 28))
layers = SequentialCell([
    convolution2dLayer(1, 20, 5),
    reluLayer(),
    averagePooling2dLayer(3),
    flattenLayer(),
    fullyConnectedLayer(20 * 26 * 26, 10),
    softmaxLayer(),
])
println(size(TyDeepLearning.predict(layers, input)))
#创建具有非重叠池化区域的二维平均池化层
layer = averagePooling2dLayer(2; Stride = 2)
input = rand(Float32, (1, 1, 28, 28))
layers = SequentialCell([
    convolution2dLayer(1, 20, 5),
    reluLayer(),
    averagePooling2dLayer(2; Stride = 2),
    flattenLayer(),
    fullyConnectedLayer(14 * 14 * 20, 10),
    softmaxLayer(),
])
println(size(TyDeepLearning.predict(layers, input)))
#创建具有重叠池化区域的二维平均池化层
layer = averagePooling2dLayer((3, 2); Stride = 2)
input = rand(Float32, (1, 1, 28, 28))
layers = SequentialCell([
    convolution2dLayer(1, 20, 5),
    reluLayer(),
    averagePooling2dLayer((3, 2); Stride = 2),
    flattenLayer(),
    fullyConnectedLayer(20 * 13 * 14, 10),
    softmaxLayer(),
])
println(size(TyDeepLearning.predict(layers, input)))
