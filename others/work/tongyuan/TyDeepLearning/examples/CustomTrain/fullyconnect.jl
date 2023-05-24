# 执行一个全连接操作，将其应用到随机产生的数组，输出操作后的数组维度
in_channel = 3
out_channel = 2
X = rand(Float32, (10, in_channel))
weights = rand(Float32, (out_channel, in_channel))
bias = rand(Float32, out_channel)
Y = fullyconnect(X, weights, bias)
print(size(Y))
