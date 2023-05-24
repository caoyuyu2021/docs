# 计算并绘制经过训练以识别鸢尾花的网络的ROC
using TyDeepLearning
using CSV
using DataFrames
input_path = "/home/tongyuan/桌面/TyDeepLearning/data/iris_dataset/irisInputs.csv"
target_path = "/home/tongyuan/桌面/TyDeepLearning/data/iris_dataset/irisTargets.csv"
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
    net, input, target; epochs=3000, loss_fun="CrossEntropyLoss", optimizer="Adam", lr=0.01
)
prob = TyDeepLearning.predict(net_trained, input)

fpr, tpr, thresholds = roc(target[:, 1], prob)
# function preclasses(prob, classes)
#     ypredclasses = []
#     for i in eachindex(range(1, size(prob)[1]))
#         maxindex = 0
#         maxnum = 0
#         for k in eachindex(classes)
#             if prob[i, :][k] > maxnum
#                 maxnum = prob[i, :][k]
#                 maxindex = k
#             end
#         end
#         ypredclasses = append!(ypredclasses, [unique(classes)[maxindex]])
#     end
#     return ypredclasses
# end
# classes = [0, 1, 2]
# output = preclasses(prob, classes)
# fpr, tpr, thresholds = roc(target[:, 1], output)
