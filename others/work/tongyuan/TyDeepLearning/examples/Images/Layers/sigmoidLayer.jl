using TyDeepLearning
#创建一个sigmoid激活函数层。
#创建一个数组，使用该层处理数组并输出结果。
layer = sigmoidLayer()
array = convert(Array{Float16}, [-1, -2, 0, 2, 1])
print(TyDeepLearning.predict(layer, array))
