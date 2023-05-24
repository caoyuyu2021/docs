using TyDeepLearning
# 创建一个GRU层,输入大小为10，隐藏层大小16，网络层数为2
#创建一个数组，使用该层处理数组并输出数组维度
InputSize = 10
numHiddenUnits = 16
layer = gruLayer(
    InputSize, numHiddenUnits; NumLayers=2, Batch_First=true, Bidirectional=false
)
array = ones(Float32, (3, 5, 10))
print(size(TyDeepLearning.predict(layer, array)))

# 创建一个包含GRU的网络 
inputSize = 12
numHiddenUnits = 100
numClasses = 9
array1 = ones(Float32, (3, 5, 12))
layers = SequentialCell([
    gruLayer(inputSize, numHiddenUnits),
    fullyConnectedLayer(numHiddenUnits * 2, numClasses),
    softmaxLayer()
])
print(size(TyDeepLearning.predict(layers, array1)))
