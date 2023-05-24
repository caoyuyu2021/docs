using TyDeepLearning
#创建一个三维裁剪层，裁剪比例为0.5。
#随机生成一个维度为（4，3，4，4）的数组，使用该层处理数组并输出结果维度。
layer = crop3dLayer(0.5)
array = rand(Float32, (4, 3, 4, 4))
print(size(TyDeepLearning.predict(layer, array)))
