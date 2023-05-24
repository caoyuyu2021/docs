using Test

tests = ["绘制树状图", "绘制具有最佳叶序的树状图"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
