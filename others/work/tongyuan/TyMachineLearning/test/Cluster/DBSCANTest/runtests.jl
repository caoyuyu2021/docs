using Test

tests = ["对输入数据执行DBSCAN"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
