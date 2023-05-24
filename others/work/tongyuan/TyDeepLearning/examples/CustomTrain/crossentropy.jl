# 计算交叉熵损失并输出
using TyDeepLearning
# 类别索引标签分类的交叉熵计算
numclass = 5
numobseravation = 3
Y = randn(Float32, (3, 5))
targets = Int32[1, 0, 4]
weights = ones(Float32, 3)
output = TyDeepLearning.crossentropy(Y, targets, weights)
print(output)

# 类别概率标签分类的交叉熵计算
numclass = 10
numobseravation = 12
Y = rand(Float32, (numobseravation, numclass))
targets = rand(Float32, (numobseravation, numclass))
weights = ones(Float32, numclass)
output = TyDeepLearning.crossentropy(Y, targets, weights)
print(output)
