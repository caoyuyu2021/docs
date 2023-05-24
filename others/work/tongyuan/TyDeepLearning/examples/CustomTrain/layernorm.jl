# 执行层归一化操作，将其应用到数组，输出操作后的数组维度
seq_len = 100
channels = 10
X = rand(Float32, (seq_len, channels))
offset = zeros(Float32, channels)
scale = ones(Float32, channels)
Y = layernorm(X, offset, scale)
print(size(Y))
