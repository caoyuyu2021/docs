using TyDeepLearning
# 执行平均池化操作，将其应用到数组，输出操作后的数组维度
batchsize = 128
inputsize = [28, 28]
channels = 3
X = rand(Float32, (batchsize, channels, inputsize[1], inputsize[2]))
kernelsize = (2, 2)
Y = avgpool(X, kernelsize)
print(size(Y))
