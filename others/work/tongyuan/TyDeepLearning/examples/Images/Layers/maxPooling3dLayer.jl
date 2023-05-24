using TyDeepLearning
#创建具有非重叠池化区域的三维最大池化层
layer = maxPooling3dLayer(2; Stride=2)
input = rand(Float32, (1, 3, 28, 28, 28))
layers = SequentialCell([
    convolution3dLayer(3, 20, 5),
    reluLayer(),
    maxPooling3dLayer(2; Stride=2),
    flattenLayer(),
    fullyConnectedLayer(20 * 14 * 14 * 14, 10),
    softmaxLayer()
])
print(size(TyDeepLearning.predict(layers, input)))
#创建具有重叠池化区域的三维最大池化层
layer = maxPooling3dLayer((3, 2, 2); Stride=2, PaddingMode="pad", Padding=(1, 0, 0))
