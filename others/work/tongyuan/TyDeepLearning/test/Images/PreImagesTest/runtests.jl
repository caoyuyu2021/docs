using Test

tests = ["augment", "augmentedImageDatastore", "imageDataAugmenter"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
