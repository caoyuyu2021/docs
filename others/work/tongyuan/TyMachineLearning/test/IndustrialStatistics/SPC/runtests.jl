using Test
using TyMachineLearning

tests = ["N向方差分析", "克鲁斯卡尔-瓦利斯试验", "单因素方差分析", "双向方差分析", "弗里德曼试验"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
