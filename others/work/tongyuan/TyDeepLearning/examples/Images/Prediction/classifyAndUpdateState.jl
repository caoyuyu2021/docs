# 训练LSTM分类网络并进行预测
using TyDeepLearning
using TyImages
using TyPlot
file = dataset_dir("digit")
XTrain, YTrain = DigitDatasetTrainData(file)
XTest, YTest = DigitDatasetTestData(file)
Train_num, Train_channel, Train_height, Train_width = size(XTrain)
Test_num, Test_channel, Test_height, Test_width = size(XTest)
XTrain = reshape(XTrain, (Train_num, Train_height, Train_width))
XTest1 = reshape(XTest, (Test_num, Test_height, Test_width))

p = randperm(5000)
index1 = p[1:1000]
index2 = p[1001:end]
X_train = XTrain[index2, :, :]
Y_train = YTrain[index2, :]
X_validation = XTrain[index1, :, :]
Y_validation = YTrain[index1, :]

options = trainingOptions(
    "CrossEntropyLoss",
    "Adam",
    "Accuracy",
    128,
    200,
    0.001;
    Plots=true,
    XValidation=X_validation,
    YValidation=Y_validation,
)

layers = SequentialCell([
    lstmLayer(28, 64; NumLayers=4, Batch_First=true, Isclassify=true),
    fullyConnectedLayer(64, 10),
    softmaxLayer(),
])

net = trainNetwork(X_train, Y_train, layers, options)

net, Y_pred = classifyAndUpdateState(net, XTest1)
classes = [i - 1 for i in range(1, 10)]
YPred = probability2classes(Y_pred, classes)
accuracy_num = zeros(size(YPred))
for i in eachindex(YPred)
    if YPred[i] == YTest[i]
        accuracy_num[i] = 1
    end
end
accuracy = sum(accuracy_num) ./ size(YPred)
print(accuracy)