using TyDeepLearning
file = dataset_dir("digit")
XTrain, YTrain = DigitTrain4DArrayData(file)
XTest, YTest = DigitTrain4DArrayData(file)

function zerocenter(data)
    data = reshape(data, (size(data)[1], 28 * 28 * 1))
    data_mean = mean(data)
    data = data .- data_mean
    data = reshape(data, (size(data)[1], 1, 28, 28))
    return data
end

function minmaxscale(data)
    data_max, _ = findmax(data)
    data_min, _ = findmin(data)
    data = (data .- data_min) ./ (data_max - data_min)
    return data, data_max, data_min
end

XTrain = zerocenter(XTrain)
XTest = zerocenter(XTest)
YTrain, Y_max, Y_min = minmaxscale(YTrain)

p = randperm(5000)
index1 = p[1:1000]
index2 = p[1001:end]
X_train = XTrain[index2, :, :, :]
Y_train = YTrain[index2, :]
X_validation = XTrain[index1, :, :, :]
Y_validation = YTrain[index1, :]

layers = SequentialCell([
    convolution2dLayer(1, 8, 3),
    batchNormalization2dLayer(8),
    reluLayer(),
    averagePooling2dLayer(2; Stride=2),
    convolution2dLayer(8, 16, 3),
    batchNormalization2dLayer(16),
    reluLayer(),
    averagePooling2dLayer(2; Stride=2),
    convolution2dLayer(16, 32, 3),
    batchNormalization2dLayer(32),
    reluLayer(),
    convolution2dLayer(32, 32, 3),
    batchNormalization2dLayer(32),
    reluLayer(),
    dropoutLayer(0.8),
    flattenLayer(),
    fullyConnectedLayer(32 * 7 * 7, 1),
])

options = trainingOptions(
    "RMSELoss",
    "Adam",
    "MSE",
    128,
    30,
    0.001;
    Shuffle=true,
    Plots=true,
    XValidation=X_validation,
    YValidation=Y_validation,
)

net = trainNetwork(X_train, Y_train, layers, options)

Y_pred = TyDeepLearning.predict(net, XTest)
YPred = Y_pred * (Y_max - Y_min) .+ Y_min
prediction_error = sqrt(mse(YTest, YPred))