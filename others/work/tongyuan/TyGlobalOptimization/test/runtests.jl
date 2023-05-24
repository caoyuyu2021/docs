using Test

tests = [
    "gaTest/runtests",
    "particleswarmTest/runtests",
    "saTest/runtests",
    "gamultiobjTest/runtests",
    "patternsearchTest/runtests",
    "paretosearchTest/runtests",
    "surrogateoptTest/runtests",
    "multistartTest/runtests"
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end



