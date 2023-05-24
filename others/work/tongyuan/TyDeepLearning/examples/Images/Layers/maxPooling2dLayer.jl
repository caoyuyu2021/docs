using TyDeepLearning
#创建一个二维最大池化层，池化核大小为3。
#创建一个维度为（1，2，4，4）、元素在（0，10）之间的数组，使用该层处理数组并输出结果维度。
layer = maxPooling2dLayer(3)
array = 10 * rand(Float32, (1, 2, 4, 4))
print(size(TyDeepLearning.predict(layer, array)))

#创建具有非重叠池化区域的二维最大池化层
layer = maxPooling2dLayer(2; Stride=2)
input = rand(Float32, (1, 1, 28, 28))
layers = SequentialCell([
    convolution2dLayer(1, 20, 5),
    reluLayer(),
    maxPooling2dLayer(2; Stride=2),
    flattenLayer(),
    fullyConnectedLayer(20 * 14 * 14, 10),
    softmaxLayer()
])
print(size(TyDeepLearning.predict(layers, input)))

#创建具有重叠池化区域的二维最大池化层
layer = maxPooling2dLayer((3, 2); Stride=2)
input = rand(Float32, (1, 1, 28, 28))
layers = SequentialCell([
    convolution2dLayer(1, 20, 5),
    reluLayer(),
    maxPooling2dLayer((3, 2); Stride=2),
    flattenLayer(),
    fullyConnectedLayer(20 * 13 * 14, 10),
    softmaxLayer()
])
print(size(TyDeepLearning.predict(layers, input)))

