# 配置图像数据增强
# [0,360]随机选择旋转因子旋转，
using TyDeepLearning
using TyImages
agumenter = imageDataAugmenter(; RandomRotation=(0, 360))
pkg_dir = pkgdir(TyImages)
source_path = pkg_dir * "/examples/resources/peppers.png"
figure(1)
imshow(source_path)

image = imread(source_path)
image = Array(image)
image = reshape(image, (1, size(image)...))
outCellArray = augment(augmenter, image)
outCellArray = outCellArray[1, :, :, :]

figure(2)
imshow(outCellArray)
