using TyDeepLearning
#创建一个二维全局最大池化层。
#随机生成一个维度为（1，3，28，28）的数组，使用该层处理数组并输出结果维度。
layer = globalAveragePooling2dLayer()
array = rand(Float32, (1, 3, 28, 28))
print(size(TyDeepLearning.predict(layer, array)))
