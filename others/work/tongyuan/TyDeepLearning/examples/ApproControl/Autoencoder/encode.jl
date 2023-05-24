# 将图像进行解码编码处理
using TyDeepLearning
XTrain, YTrain = DigitDatasetTrainData()
XTest, YTest = DigitDatasetTestData()

XTrain = reshape(XTrain, (size(XTrain)[1], size(XTrain)[2] * size(XTrain)[3] * size(XTrain)[4]))
XTest = reshape(XTest, (size(XTest)[1], size(XTest)[2] * size(XTest)[3] * size(XTest)[4]))
hiddensize = 50
autoenc = trainAutoencoder(XTrain, hiddensize)
features = encode(autoenc, XTest)