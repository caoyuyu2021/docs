# 创建一个一维实例归一化层
using TyDeepLearning
array = ones(Float32,(2,3,5))
layer = instanceNormalization1dLayer(3)
TyDeepLearning.predict(layer, array)