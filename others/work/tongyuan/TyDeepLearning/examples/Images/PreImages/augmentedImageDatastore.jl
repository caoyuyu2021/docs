# 增强图像数据存储
# [0,360]随机选择旋转因子旋转
using TyDeepLearning
using TyImages
augmenter = imageDataAugmenter(; RandomRotation=(0, 360))

file = dataset_dir("digit")
XTrain, YTrain = DigitTrain4DArrayData(file)
XTrain = permutedims(XTrain, (1, 3, 4, 2))
xtrain = permutedims(XTrain[1:8, :, :, 1], (2, 3, 1))
figure(1)
out1 = imtile(xtrain; frames=1:3)
imshow(out1)

image_size = 56
auimds = augmentedImageDatastore(image_size, XTrain, YTrain, augmenter)
auimds = auimds[1:3, :, :, 1]
auimds = permutedims(auimds, (2, 3, 1))
figure(2)
out2 = imtile(auimds)
imshow(out2)
