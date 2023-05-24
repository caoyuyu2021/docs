# 创建一个三维转置卷积层，输入维度为 16，输出维度为 3，卷积核宽度为（4，6，2）。
# 创建一个维度为（32，16，10，32，32）、元素均为 1 的数组，使用该层处理数组并输出结果维度。
layer = transposedConv3dLayer(16, 3, (4, 6, 2); PaddingMode="pad")
array = ones(Float32, (32, 16, 10, 32, 32))
print(size(TyDeepLearning.predict(layer, array)))