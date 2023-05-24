using TyDeepLearning
#创建二维卷积层
input = rand(Float32, (1, 1, 28, 28))
layers = SequentialCell([
    convolution2dLayer(1, 20, 5; Stride=4),
    reluLayer(),
    maxPooling2dLayer(2; Stride=4),
    flattenLayer(),
    fullyConnectedLayer(20 * 2 * 2, 10),
    softmaxLayer()
])
print(size(TyDeepLearning.predict(layers, input)))
#创建一个二维卷积层，输入通道数为120，输出通道数为240，二维卷积核的高度和宽度为4。
#创建维度为（1，120，1024，640）、元素均为1的数组，使用该层处理数组并输出结果维度。
layer = convolution2dLayer(120, 240, 4)
array = ones(Float32, (1, 120, 1024, 640))
print(size(TyDeepLearning.predict(layer, array)))
