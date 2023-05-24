using Test

tests = ["因子分析", "旋转系数荷载"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
