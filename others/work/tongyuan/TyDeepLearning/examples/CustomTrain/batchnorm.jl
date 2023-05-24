using TyDeepLearning
# 执行批归一化操作，将其应用到数组，输出操作后的数组
X = rand(Float32, (2, 2))
bias = rand(Float32, (2))
scale = rand(Float32, (2))
mean = rand(Float32, (2))
var = rand(Float32, (2))
Y = batchnorm(X, bias, scale, mean, var)
print(Y)
