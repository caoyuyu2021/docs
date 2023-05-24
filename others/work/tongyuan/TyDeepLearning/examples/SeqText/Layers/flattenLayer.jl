using TyDeepLearning
# 创建一个平展层, 使用该层处理数组并输出结果维度
x = [[[1.2, 1.2], [2.1, 2.1]], [[2.2, 2.2], [3.2, 3.2]]]
layer = flattenLayer()
print(size(TyDeepLearning.predict(layer, x)))
