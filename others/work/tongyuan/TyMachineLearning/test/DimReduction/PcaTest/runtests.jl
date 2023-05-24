using Test

tests = ["巴特利特检验", "原始数据的主成分分析"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
