using TyDeepLearning
file = dataset_dir("digit")
XTrain, YTrain = DigitDatasetTrainData(file)

p = randperm(5000)
index1 = p[1:1000]
index2 = p[1001:end]
X_train = XTrain[index2, :, :, :]
Y_train = YTrain[index2, :]
X_validation = XTrain[index1, :, :, :]
Y_validation = YTrain[index1, :]

Loss = "CrossEntropyLoss"
Optimizer = "Momentum"
Metrics = "Accuracy"
BatchSize = 64
Epoch = 50
LearnRate = 0.01
options = trainingOptions(
    Loss,
    Optimizer,
    Metrics,
    BatchSize,
    Epoch,
    LearnRate;
    Plots=true,
    XValidation=X_validation,
    YValidation=Y_validation,
)

Number, Channel, Height, Width = size(X_train)
FilterSize = 3
layers = SequentialCell([
    convolution2dLayer(Channel, 8, FilterSize),
    batchNormalization2dLayer(8),
    reluLayer(),
    maxPooling2dLayer(2; Stride=2),
    convolution2dLayer(8, 16, FilterSize),
    batchNormalization2dLayer(16),
    reluLayer(),
    maxPooling2dLayer(2; Stride=2),
    convolution2dLayer(16, 32, FilterSize),
    batchNormalization2dLayer(32),
    reluLayer(),
    flattenLayer(),
    fullyConnectedLayer(32 * 7 * 7, 10),
    softmaxLayer(),
])

net = trainNetwork(X_train, Y_train, layers, options)