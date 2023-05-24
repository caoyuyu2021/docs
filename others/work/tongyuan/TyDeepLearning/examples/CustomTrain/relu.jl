# 执行relu函数操作，将其应用到随机产生的数组，输出操作后的数组维度
batch = 128
input_size = [28, 28]
channels = 3
X = rand(Float32, (batch, channels, input_size[1], input_size[2]))
Y = relu(X)
print(size(Y))
