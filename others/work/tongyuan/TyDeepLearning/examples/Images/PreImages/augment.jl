# 将相同的图像增强处理应用于不同图像
using TyDeepLearning
using TyImages
augmenter = imageDataAugmenter(; RandomRotation=(0, 360))
pkg_dir = pkgdir(TyImages)
source_path1 = pkg_dir * "/examples/resources/peppers.png"
source_path2 = pkg_dir * "/examples/resources/corn.tif"
out = imtile([source_path1, source_path2])
figure(1)
imshow(out)

image1 = imread(source_path1)
image1 = Array(image1)
image11 = reshape(image1, (1, size(image1)...))
outCellArray1 = augment(augmenter, image11)
outCellArray1 = outCellArray1[1, :, :, :]

image2 = imread(source_path2)
image2 = Array(image2)
image22 = reshape(image2, (1, size(image2)...))
outCellArray2 = augment(augmenter, image22)
outCellArray2 = outCellArray2[1, :, :, :]

out = [outCellArray1, outCellArray2]
figure(2)
imshow(outCellArray1)
figure(3)
imshow(outCellArray2)
