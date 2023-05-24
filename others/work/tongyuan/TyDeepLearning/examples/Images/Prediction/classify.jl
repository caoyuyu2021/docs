using TyDeepLearning
using TyImages
using TyPlot

file = dataset_dir("digit")
XTrain, YTrain = DigitDatasetTrainData(file)
XTest, YTest = DigitDatasetTestData(file)

p = randperm(5000)
index1 = p[1:1000]
index2 = p[1001:end]
X_train = XTrain[index2, :, :, :]
Y_train = YTrain[index2, :]
X_validation = XTrain[index1, :, :, :]
Y_validation = YTrain[index1, :]

options = trainingOptions(
    "CrossEntropyLoss",
    "Momentum",
    "Accuracy",
    64,
    50,
    0.01;
    Plots=true,
    XValidation=X_validation,
    YValidation=Y_validation,
)

layers = SequentialCell([
    convolution2dLayer(1, 8, 3),
    batchNormalization2dLayer(8),
    reluLayer(),
    maxPooling2dLayer(2; Stride=2),
    convolution2dLayer(8, 16, 3),
    batchNormalization2dLayer(16),
    reluLayer(),
    maxPooling2dLayer(2; Stride=2),
    convolution2dLayer(16, 32, 3),
    batchNormalization2dLayer(32),
    reluLayer(),
    flattenLayer(),
    fullyConnectedLayer(32 * 7 * 7, 10),
    softmaxLayer(),
])

net = trainNetwork(X_train, Y_train, layers, options)