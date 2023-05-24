using TyDeepLearning
#创建softmax激活函数层
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
#创建一个softmax激活函数层。
#创建一个数组，使用该层处理数组并输出结果，检验结果各维度加和是否为1。
layer = softmaxLayer()
array = convert(Array{Float16}, [-1, -2, 0, 2, 1])
println(TyDeepLearning.predict(layer, array))
print(sum(TyDeepLearning.predict(layer, array)))
