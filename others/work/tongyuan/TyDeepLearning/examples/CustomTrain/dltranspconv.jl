#执行2-D转置卷积操作
# 创建一个随机数组，计算并输出转置卷积后的数组维度
input_size = [30, 30]
batch = 10
channel = 32
X = rand(Float32, (batch, channel, input_size[1], input_size[2]))
filter_size = [3, 3]
outputsize = 32
Weights = rand(Float32, (outputsize, channel, filter_size[1], filter_size[2]))
Y = dltranspconv(X, Weights)
print(size(Y))
