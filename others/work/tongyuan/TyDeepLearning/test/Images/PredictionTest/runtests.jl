using Test

tests = [
    "classify",
    "classifyAndUpdateState",
    "confusionchart",
    "predict",
    "predictAndUpdateState",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
