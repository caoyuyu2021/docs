# 创建一个三维实例归一化层
using TyDeepLearning
array = ones(Float32, (2, 3, 5, 2, 2))
layer = instanceNormalization3dLayer(3)
TyDeepLearning.predict(layer, array)