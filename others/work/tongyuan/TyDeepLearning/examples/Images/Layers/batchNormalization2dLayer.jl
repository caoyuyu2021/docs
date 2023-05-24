using TyDeepLearning
#创建一个二维批标准层，通道数为3。
#创建维度为（1，3，2，2）、元素均为1的数组，使用该层处理数组。
layer = batchNormalization2dLayer(3)
array = ones(Float32, (1, 3, 2, 2))
print(size(TyDeepLearning.predict(layer, array)))
