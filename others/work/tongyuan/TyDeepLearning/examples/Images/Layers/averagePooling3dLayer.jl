using TyDeepLearning
#创建具有非重叠池化区域的三维平均池化层
layer = averagePooling3dLayer(2; Stride=2)
input = rand(Float32, (1, 3, 28, 28, 28))
layers = SequentialCell([
    convolution3dLayer(3, 20, 5),
    reluLayer(),
    averagePooling3dLayer(2; Stride=2),
    flattenLayer(),
    fullyConnectedLayer(20 * 14 * 14 * 14, 10),
    softmaxLayer()
])
print(TyDeepLearning.predict(layers, input))
#创建具有重叠池化区域的三维平均池化层
layer = averagePooling3dLayer(
    (3, 3, 2); Stride=2, PaddingMode="pad", Padding=(1, 0, 0, 1, 0, 0)
)
#创建一个三维平均池化层，池化核尺寸为2。
#随机生成维度为（1，2，2，2，3）的数组，使用该层处理数组并输出结果。
pool = averagePooling3dLayer(2)
array = rand(Float16, (1, 2, 2, 2, 3))
print(size(TyDeepLearning.predict(pool, array)))
