# 执行局部响应归一化操作，将其应用到数组，输出操作后的数组维度
batch = 10
input_size = [8, 8]
channels = 6
X = rand(Float32, (batch, channels, input_size[1], input_size[2]))
Y = crosschannelnorm(X)
println(size(Y))
