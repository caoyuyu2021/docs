using TyDeepLearning
using Test

@testset "augmentedImageDatastore.jl" begin
    @testset "使用增强图像训练网络" begin
        file = dataset_dir("digit")
        augmenter = imageDataAugmenter(; RandomRotation=(0, 360))
        XTrain1, YTrain = DigitTrain4DArrayData(file)
        XTrain = permutedims(XTrain1, (1, 3, 4, 2))
        newmap = rand(28, 3)
        xtrain = permutedims(XTrain[1:8, :, :, 1], (2, 3, 1))
        image_size = 56
        auimds = augmentedImageDatastore(image_size, XTrain, YTrain, augmenter)
        auimds = auimds[1:3, :, :, 1]
        @test size(auimds) == (3, 56, 56)
    end
end
