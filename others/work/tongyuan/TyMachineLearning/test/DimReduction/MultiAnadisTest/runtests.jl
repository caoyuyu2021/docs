using Test

tests = ["马氏距离", "经典多维标度"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
