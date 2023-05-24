using Test

tests = [
    "dlconv",
    "dltranspconv",
    "lstm",
    "fullyconnect",
    "relu",
    "leakyrule",
    "batchnorm",
    "crosschannelnorm",
    "groupnorm",
    "layernorm",
    "avgpool",
    "maxpool",
    "softmax",
    "sigmoid",
    "huber",
    "mse",
    "crossentropy",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
