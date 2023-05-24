using TyDeepLearning
#创建一个一维平均池化层，池化核尺寸为5，移动步长为1。
#随机生成维度为（1，3，6）的数组，使用该层处理数组并输出数组维度。
pool = averagePooling1dLayer(5; Stride=1)
array = rand(Float16, (1, 3, 6))
print(size(TyDeepLearning.predict(pool, array)))
