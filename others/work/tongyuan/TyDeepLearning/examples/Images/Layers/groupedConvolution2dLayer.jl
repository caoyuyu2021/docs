using TyDeepLearning
#创建一个二维分组卷积层。
layer = groupedConvolution2dLayer(1, 10, (11, 11), 1)
input = rand(Float32, (1, 1, 28, 28))
print(size(TyDeepLearning.predict(layer, input)))
