using TyDeepLearning

#获取数据集
file = joinpath(pwd(), "data/servowing/servowing_data.csv")
data = CSV.read(file, DataFrame; header=true)
#获取训练数据集
train_data = Array(data[:, 1:4])
train_label = Array(data[:, 5:end])
#设置网络层
layers = SequentialCell([
    fullyConnectedLayer(4, 100), sigmoidLayer(), fullyConnectedLayer(100, 24)
])
#设置参数
LearnRate = 1e-5
Loss = "L1Loss"
Optimizer = "AdamWeightDecay"
Metrics = "MSE"
BatchSize = 501
Epoch = 5000
options = trainingOptions(
    Loss,
    Optimizer,
    Metrics,
    BatchSize,
    Epoch,
    LearnRate;
    Shuffle=false,
    Verbose=true,
    ExecutionEnvironment="GPU",
    Plots=true,
)
#训练模型
net = trainNetwork(train_data, train_label, layers, options)

input_tensor = Array(data[:, 1:4])
file = "/home/tongyuan/servowing.mindir"
TyDeepLearning.save(layers, file; input_tensor)