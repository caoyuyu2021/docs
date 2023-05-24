using TyDeepLearning
#创建一个一维最大池化层，池化核大小为3。
#创建一个维度为（1，2，4）、元素在（0，10）之间的数组，使用该层处理数组并输出结果维度。
layer = maxPooling1dLayer(3)
array = 10 * rand(Float32, (1, 2, 4))
print(size(TyDeepLearning.predict(layer, array)))
