using TyDeepLearning
#创建全连接层
layer = fullyConnectedLayer(10 * 24 * 24, 10)
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
#创建指定初始权重和偏置的全连接层
layer = fullyConnectedLayer(
    20 * 14 * 14, 10; WeightsInitializer="normal", BiasInitializer="zeros", Bias=true
)
#创建一个全连接层。
#创建一个数组，使用该层处理数组并输出结果。
layer = fullyConnectedLayer(3, 4)
array = Array{Float32}[[180.0, 234, 154], [244, 48, 247]]
print(TyDeepLearning.predict(layer, array))
