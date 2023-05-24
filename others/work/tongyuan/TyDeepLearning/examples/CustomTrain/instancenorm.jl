# 执行实例归一化操作，将其应用到数组
# GPU 
batch = 16
input_size = [12, 12]
channels = 6
X = rand(Float32, (batch, channels, input_size[1], input_size[2]))
offset = zeros(Float32, channels)
scale = ones(Float32, channels)
Y = instancenorm(X, offset, scale)
print(size(Y))
