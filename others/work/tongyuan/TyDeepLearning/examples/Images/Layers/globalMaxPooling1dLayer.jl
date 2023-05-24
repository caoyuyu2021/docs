using TyDeepLearning
#创建一个一维全局最大池化层。
#随机生成一个维度为（1，3，6）的数组，使用该层处理数组并输出结果维度。
layer = globalMaxPooling1dLayer()
array = rand(Float32, (1, 3, 6))
print(size(TyDeepLearning.predict(layer, array)))
