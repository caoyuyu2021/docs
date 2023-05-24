using TyDeepLearning
#创建一个一维批标准化层，通道数量为4。
#创建一个数组，使用该层处理数组并输出数组维度。
layer = batchNormalization1dLayer(4)
array = Array{Float32}[[0.7, 0.5, 0.5, 0.6], [0.5, 0.4, 0.6, 0.9]]
print(size(TyDeepLearning.predict(layer, array)))
