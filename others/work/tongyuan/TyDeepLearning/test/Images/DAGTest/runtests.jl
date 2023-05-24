using Test

tests = [
    "layerGraph",
    "lgplot",
    "addLayers",
    "removeLayers",
    "replaceLayer",
    "isequal",
    "isequaln",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
