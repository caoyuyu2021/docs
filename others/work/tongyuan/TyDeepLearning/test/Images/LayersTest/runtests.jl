using Test

tests = [
    "convolution1dLayer",
    "convolution2dLayer",
    "convolution3dLayer",
    "groupedConvolution2dLayer",
    "transposedConv2dLayer",
    "transposedConv3dLayer",
    "fullyConnectedLayer",
    "reluLayer",
    "leakyReluLayer",
    "eluLayer",
    "tanhLayer",
    "swishLayer",
    "batchNormalization1dLayer",
    "batchNormalization2dLayer",
    "batchNormalization3dLayer",
    "groupNormalizationLayer",
    "instanceNormalization1dLayer",
    "instanceNormalization2dLayer",
    "instanceNormalization3dLayer",
    "layerNormalizationLayer",
    "dropoutLayer",
    "crop2dLayer",
    "crop3dLayer",
    "averagePooling1dLayer",
    "averagePooling2dLayer",
    "averagePooling3dLayer",
    "globalAveragePooling1dLayer",
    "globalAveragePooling2dLayer",
    "globalMaxPooling1dLayer",
    "globalMaxPooling2dLayer",
    "globalMaxPooling3dLayer",
    "maxPooling1dLayer",
    "maxPooling2dLayer",
    "maxPooling3dLayer",
    "sigmoidLayer",
    "softmaxLayer",
    "clippedReluLayer",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
