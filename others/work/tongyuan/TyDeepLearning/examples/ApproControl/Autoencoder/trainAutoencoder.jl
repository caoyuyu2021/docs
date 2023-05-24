# 使用自动编码器重建手写数字图像
using TyDeepLearning
using TyImages
XTrain1, _ = DigitDatasetTrainData()
XTest1, _ = DigitDatasetTestData()

XTrain = reshape(
    XTrain1, (size(XTrain1)[1], size(XTrain1)[2] * size(XTrain1)[3] * size(XTrain1)[4])
)
XTest = reshape(
    XTest1, (size(XTest1)[1], size(XTest1)[2] * size(XTest1)[3] * size(XTest1)[4])
)
hiddensize = 50
autoenc = trainAutoencoder(XTrain, hiddensize)
XReconstructed = TyDeepLearning.predict(autoenc, XTest)
figure(1)
for i in range(1, 20)
    subplot(4, 5, i)
    imshow(XTest1[i, 1, :, :])
end
XReconstructed = reshape(XReconstructed, (5000, 28, 28))
figure(3)
for i in range(1, 20)
    subplot(4, 5, i)
    imshow(XReconstructed[i, :, :])
end

# 训练自动编码器
file1 = joinpath(pwd(), "data/iris_dataset/irisInputs.csv")
data = CSV.read(file1, DataFrame; header=false)
train_data = Array(data[1:2:end, :])
test_data = Array(data[2:2:end, :])
hiddensize = 30
autoenc = trainAutoencoder(train_data, hiddensize)
x_re = TyDeepLearning.predict(autoenc, test_data)

error = mse(x_re, test_data)
