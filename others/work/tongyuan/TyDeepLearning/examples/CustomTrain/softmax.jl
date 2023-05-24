# 执行softmax激活操作，将其应用到数组，输出操作后的数组
X = rand(Float32, (3, 2))
Y = softmax(X)
print(Y)
