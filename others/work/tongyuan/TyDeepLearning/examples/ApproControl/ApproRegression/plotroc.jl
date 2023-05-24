# 绘制网络的ROC曲线图
# 计算并绘制经过训练以识别鸢尾花的网络的ROC
using TyDeepLearning
using CSV
using DataFrames
input_path = "/home/tongyuan/deep-learning/TyDeepLearning/data/iris_dataset/irisInputs.csv"
target_path = "/home/tongyuan/deep-learning/TyDeepLearning/data/iris_dataset/irisTargets.csv"
input = CSV.read(input_path, DataFrame; header=false)
target = CSV.read(target_path, DataFrame; header=false)
input = Array(input)
target = Array(target)
inputsize = 4
hiddenSizes = 20
outputsize = 3
net = SequentialCell([
    fullyConnectedLayer(inputsize, hiddenSizes),
    sigmoidLayer(),
    fullyConnectedLayer(hiddenSizes, outputsize),
    softmaxLayer()
])

net_trained = train(
    net, input, target; epochs=100, loss_fun="CrossEntropyLoss", optimizer="Adam", lr = 0.01
)
prob = TyDeepLearning.predict(net_trained, input)
plotroc(target[:, 1], prob)
