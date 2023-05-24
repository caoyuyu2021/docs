using TyDeepLearning
using Test

@testset "imageDataAugmenter.jl" begin
    @testset "创建图像数据索引以调整图像大小和旋转图像" begin
        augmenter = imageDataAugmenter(; Resize=(200, 200), RandomRotation=(0, 360))
        I = rand(1:255, 1, 300, 300, 1)
        dataset = augment(augmenter, I)
        @test size(dataset) == (1, 200, 200, 1)
    end
end
