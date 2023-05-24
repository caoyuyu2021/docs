using TyDeepLearning
#创建一个剪切的修正线性单元激活函数层。
#创建一个数组，使用该层处理数组并输出结果。
layer = clippedReluLayer()
array = [-1 2 -3 2 -1 7]
print(TyDeepLearning.predict(layer, array))
