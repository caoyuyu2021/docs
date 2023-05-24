using Test

tests = ["trainSoftmaxLayer", "decode", "encode", "trainAutoencoder"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
