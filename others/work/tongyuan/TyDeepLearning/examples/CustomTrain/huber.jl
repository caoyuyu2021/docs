# 计算huber损失并输出其维度
numclass = 10
numobseravation = 12
Y = rand(Float32, (numclass, numobseravation))
target = rand(Float32, (numclass, numobseravation))
output = huber(Y, target)
print(size(output))
