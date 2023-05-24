using TyDeepLearning
#创建一个三维卷积层
input = rand(Float32, (1, 3, 28, 28, 28))
layers = SequentialCell([
    convolution3dLayer(3, 16, 5; Stride=4),
    reluLayer(),
    maxPooling3dLayer(2; Stride=4),
    flattenLayer(),
    fullyConnectedLayer(16 * 2 * 2 * 2, 10),
    softmaxLayer()
])
print(size(TyDeepLearning.predict(layers, input)))
#创建一个三维卷积层，输入通道数为3，输出通道数为32，三维卷积核的大小为（4，3，3）。
#创建维度为（16，3，10，32，32）、元素均为1的数组，使用该层处理数组并输出结果维度。
layer = convolution3dLayer(3, 32, (4, 3, 3))
array = ones(Float32, (16, 3, 10, 32, 32))
print(size(TyDeepLearning.predict(layer, array)))
