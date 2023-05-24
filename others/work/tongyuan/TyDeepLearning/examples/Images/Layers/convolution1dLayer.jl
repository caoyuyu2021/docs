using TyDeepLearning
#创建一个一维卷积层，输入通道数为120，输出通道数为240，一维卷积核大小为4。
#创建维度为(1, 120, 640)、元素均为1的数组，使用该层处理数组并输出结果维度。
layer = convolution1dLayer(120, 240, 4)
array = ones(Float32, (1, 120, 640))
print(size(TyDeepLearning.predict(layer, array)))
