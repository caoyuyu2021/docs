# 执行GRU操作，将其应用于随机产生的时序数据，输出操作后的数组维度
# ascend
seq_len = 2
batch_size = 8
inputsize = 64
x = rand(Float32, (seq_len, batch_size, inputsize))
numHiddenUnits = 3
h0 = rand(Float16, (numHiddenUnits, numHiddenUnits * 3))
weights = rand(Float16, (inputsize, 3 * numHiddenUnits))
bias = rand(Float16, (2, 3 * numHiddenUnits))
output = gru(x, h0, weights, bias)
print(size(output))
