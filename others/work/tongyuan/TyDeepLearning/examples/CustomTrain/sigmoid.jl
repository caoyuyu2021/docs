# 执行sigmoid激活操作，将其应用到数组，输出操作后的数组维度
inputsize = [7, 7]
batch = 1
channels = 3
X = rand(Float32, (batch, channels, inputsize[1], inputsize[2]))
Y = sigmoid(X)
print(size(Y))
