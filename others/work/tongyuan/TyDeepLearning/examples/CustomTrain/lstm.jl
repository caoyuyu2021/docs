# 执行LSTM操作，将其应用到随机产生的时序数据
seq_len = 64
batch_size = 32
inputsize = 10
x = randn(Float32, (seq_len, batch_size, inputsize))
numHiddenUnits = 3
numlayers = 1
h0 = zeros(Float32, (numlayers * 1, batch_size, numHiddenUnits))
c0 = zeros(Float32, (numlayers * 1, batch_size, numHiddenUnits))
weights = rand(Float32, (112, 1, 1))
output = lstm(x, h0, c0, weights)
print(size(output))
