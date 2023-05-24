using TyDeepLearning
#创建一个三维批标准层，通道数为3。
#创建维度为（16，3，10，32，32）、元素均为1的数组，使用该层处理数组并输出结果维度。
layer = batchNormalization3dLayer(3)
array = ones(Float32, (16, 3, 10, 32, 32))
print(size(TyDeepLearning.predict(layer, array)))
