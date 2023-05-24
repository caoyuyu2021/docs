# 执行组归一化操作，将其应用到数组，输出操作后的数组维度
batch = 1
input_size = [4, 4]
channels = 6
numgroups = 3
X = rand(Float32, (batch, channels, input_size[1], input_size[2]))
offset = zeros(Float32, channels)
scale = ones(Float32, channels)
Y = groupnorm(X, numgroups, offset, scale)
print(size(Y))
