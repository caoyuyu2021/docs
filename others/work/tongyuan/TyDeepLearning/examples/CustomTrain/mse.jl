# 计算均方误差损失并输出
inputsize = [6, 6]
batch = 1
channel = 1
Y = rand(Float32, (batch, channel, inputsize[1], inputsize[2]))
target = ones(Float32, (batch, channel, inputsize[1], inputsize[2]))
output = mse(Y, target)
print(output)
