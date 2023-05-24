using TyDeepLearning

file = dataset_dir("digit")
XTrain, YTrain = DigitDatasetTrainData(file)

p = randperm(5000)
index1 = p[1:750]
index2 = p[751:end]
X_train = XTrain[index2, :, :, :]
Y_train = YTrain[index2, :]
X_Test = XTrain[index1, :, :, :]
Y_Test = YTrain[index1, :]

options = trainingOptions(
    "CrossEntropyLoss", "Momentum", "Accuracy", 128, 500, 0.001; Plots=true
)

layers = SequentialCell([
    convolution2dLayer(1, 20, 5),
    reluLayer(),
    maxPooling2dLayer(2; Stride=2),
    flattenLayer(),
    fullyConnectedLayer(20 * 14 * 14, 10),
    softmaxLayer(),
])

net = trainNetwork(X_train, Y_train, layers, options)

file = joinpath(pkgdir(TyDeepLearning), "test/Images/TrainNetworkTest/net.ckpt")
TyDeepLearning.save(layers, file)