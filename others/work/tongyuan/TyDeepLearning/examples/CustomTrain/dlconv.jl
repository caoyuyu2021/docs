# 执行2-D卷积操作
# 创建一个随机数组，计算并输出卷积后的数组维度
input_size = [28, 28]
batch = 128
channel = 3
X = rand(Float32, (batch, channel, input_size[1], input_size[2]))
filter_size = [3, 3]
num_filter = 64
Weights = rand(Float32, (num_filter, channel, filter_size[1], filter_size[2]))
Y = dlconv(X, Weights)
print(size(Y))
