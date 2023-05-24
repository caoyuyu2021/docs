using TyDeepLearning
using TyPlot
using TyImages
# 训练网络用于图像分类
file = dataset_dir("digit")
XTrain, YTrain = DigitDatasetTrainData(file)
p = randperm(5000)
index = p[1:20]
figure(1)
for i in eachindex(range(1, 20))
    subplot(4, 5, i)
    imshow(XTrain[index[i], 1, :, :])
end
index1 = p[1:750]
index2 = p[751:end]
X_train = XTrain[index2, :, :, :]
Y_train = YTrain[index2]
X_Test = XTrain[index1, :, :, :]
Y_Test = YTrain[index1]

options = trainingOptions(
    "CrossEntropyLoss", "Momentum", "Accuracy", 128, 50, 0.001; Plots=true
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

function preclasses(prob, classes)
    ypredclasses = []
    for i in eachindex(range(1, size(prob)[1]))
        maxindex = 0
        maxnum = 0
        for k in eachindex(classes)
            if prob[i, :][k] > maxnum
                maxnum = prob[i, :][k]
                maxindex = k
            end
        end
        ypredclasses = append!(ypredclasses, [unique(classes)[maxindex]])
    end
    return ypredclasses
end
YPred = TyDeepLearning.predict(net, X_Test)
classes = [i - 1 for i in range(1, 10)]
YPred1 = preclasses(YPred, classes)
# accuracy_num = zeros(size(YPred1))
# for i in eachindex(YPred1)
#     if YPred1[i] == Y_Test[i]
#         accuracy_num[i] = 1
#     end
# end
accuracy = Accuracy(YPred, Y_Test)

figure(3)
p2 = randperm(750)
index = p2[1:9]
for i in eachindex(range(1, 9))
    TyPlot.subplot(3, 3, i)
    TyImages.imshow(X_Test[index[i], 1, :, :])
    title1 = "Prediction Label"
    title2 = string(YPred1[index[i]])
    title(string(title1, ": ", title2))
end

# 训练网络用于增强处理后的图像分类
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

N, Channel, Hight, Width = size(X_train)
p2 = randperm(N)
index = p2[1:20]
figure(1)
for i in eachindex(range(1, 20))
    subplot(4, 5, i)
    imshow(X_train[index[i], 1, :, :])
end

imageAugmenter = imageDataAugmenter(; RandomRotation=20)
X_train2 = permutedims(X_train, (1, 3, 4, 2))
imagesize = (28, 28)
augimds = augmentedImageDatastore(imagesize, X_train2, Y_train, imageAugmenter)

augimds = permutedims(augimds, (1, 4, 2, 3))
figure(2)
for i in eachindex(range(1, 20))
    subplot(4, 5, i)
    imshow(augimds[index[i], 1, :, :])
end

layers = SequentialCell([
    convolution2dLayer(Channel, 8, 3),
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

options = trainingOptions(
    "CrossEntropyLoss",
    "Adam",
    "Accuracy",
    64,
    100,
    0.01;
    Shuffle=false,
    Plots=true,
    XValidation=X_validation,
    YValidation=Y_validation,
)

net = trainNetwork(augimds, Y_train, layers, options)

using TyDeepLearning
using TyPlot
using TyImages
# 训练网络用于图像回归
function zerocenter(data)
    data = reshape(data, (size(data)[1], 28 * 28 * 1))
    data_mean = mean(data; dims=1)
    data_std = std(data; dims=1)
    data = (data .- data_mean) ./ data_std
    data = reshape(data, (size(data)[1], 1, 28, 28))
    return data
end
function minmaxscale(data)
    data_max = maximum(data; dims=1)
    data_min = minimum(data; dims=1)
    data = (data .- data_min) ./ (data_max .- data_min)
    return data, data_max, data_min
end

XTrain1, YTrain1 = DigitTrain4DArrayData()
p2 = randperm(5000)
index = p2[1:20]
figure(1)
for i in eachindex(range(1, 20))
    subplot(4, 5, i)
    imshow(XTrain1[index[i], 1, :, :])
end
XTrain = XTrain1
YTrain = YTrain1
# figure(2)
# for i in eachindex(range(1, 20))
#     subplot(4, 5, i)
#     imshow(XTrain[index[i], 1, :, :])
# end
layers = SequentialCell([
    convolution2dLayer(1, 25, 12),
    reluLayer(),
    flattenLayer(),
    fullyConnectedLayer(25 * 28 * 28, 1),
])
options = trainingOptions("RMSELoss", "Adam", "MSE", 10, 30, 0.0001; Plots=true)
net = trainNetwork(XTrain, YTrain, layers, options)
XTest1, YTest = DigitTest4DArrayData()
XTest = XTest1
YPred = TyDeepLearning.predict(net, XTest)
rmse = sqrt(mse(YTest, YPred))
