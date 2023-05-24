using TyDeepLearning
#创建一个一维转置卷积层，输入维度为3，输出维度为64，卷积核宽度为4，同时对输入进行填充。
#创建一个维度为（1，3，50）、元素均为1的数组，使用该层处理数组并输出结果维度。
layer = transposedConv1dLayer(
    3, 64, 4; Bias=false, WeightsInitializer="normal", PaddingMode="pad"
)
array = ones(Float32, (1, 3, 50))
print(size(TyDeepLearning.predict(layer, array)))
