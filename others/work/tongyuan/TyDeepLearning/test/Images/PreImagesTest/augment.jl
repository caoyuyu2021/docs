using TyDeepLearning
using TyImages
using Test

@testset "augment.jl" begin
    @testset "使用自定义旋转范围增强图像数据" begin
        augmenter = imageDataAugmenter(; RandomRotation=(0, 360))
        pkg_dir = pkgdir(TyDeepLearning)
        source_path1 = pkg_dir * "/test/Images/PreImagesTest/peppers.png"
        image1 = imread(source_path1)
        image1 = Array(image1)
        image1 = reshape(image1, (1, size(image1)...))
        outCellArray1 = augment(augmenter, image1)
        @test size(outCellArray1) == size(image1)
    end
end
