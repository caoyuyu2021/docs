using TyDeepLearning
# 创建一个序列展开层,输入大小为(1,2,2,1),步长为(1, 2, 2, 1)
#创建一个数组，使用该层处理数组
# GPU

ksizes = (1, 2, 2, 1)
layer = sequenceUnfoldingLayer(ksizes; Stride=(1, 2, 2, 1), Rates=(1, 2, 2, 1))
array = ones(Float16, (2, 3, 6, 6))
TyDeepLearning.predict(layer, array)
