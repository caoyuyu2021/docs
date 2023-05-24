# 利用mobilenetv2对图像进行分类预测并绘制直方图
using TyDeepLearning
using TyImages
network = mobilenetv2()
numclasses = 1000

pkg_dir = pkgdir(TyImages)
source_path1 = pkg_dir * "/test/resources/peppers.png"
image = imread(source_path1)
figure(1)
imshow(image)

I = TyImages.imresize(image, [224 224])
I = reshape(I, (1, size(I)...))
I = permutedims(I, (1, 4, 2, 3))
label = TyDeepLearning.predict(network, I)
layer = softmaxLayer()
label = TyDeepLearning.predict(layer, label)
index = sortperm(label[1, :]; rev=true)

f = open("/home/tongyuan/deep-learning/TyDeepLearning/data/imagenet/imagenet_classes.txt")
class_name = readlines(f)
close(f)
top_index = index[1:5]
classname_top = class_name[top_index]
score_top = label[1, top_index]
# 绘图
I = permutedims(I, (1, 3, 4, 2))
I = I[1, :, :, :]
figure(2)
imshow(I)
topprob = string(100 * score_top[1])
title(string(classname_top[1], ",", topprob, "%"))
# 绘制直方图
figure(3)
barh(score_top)
xlim = [0, 1]
title("Top 5 Predictions")
xlabel("Probability")
yticklabels(classname_top)
