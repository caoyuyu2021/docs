using TyDeepLearning
# 创建三维全局最大池化层
layer = globalMaxPooling3dLayer()
input = rand(Float32, (1, 3, 28, 28, 28))
print(TyDeepLearning.predict(layer, input))
layers = SequentialCell([
   convolution3dLayer(3, 20, 5),
   reluLayer(),
   globalMaxPooling3dLayer(),
   flattenLayer(),
   fullyConnectedLayer(20, 10),
   softmaxLayer()
])
print(TyDeepLearning.predict(layers, input))
