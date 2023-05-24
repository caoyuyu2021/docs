# 创建一个二维实例归一化层
using TyDeepLearning
array = ones(Float32, (2, 3, 2, 2))
layer = instanceNormalization2dLayer(3)
TyDeepLearning.predict(layer, array)