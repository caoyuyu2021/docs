using Test
using TyMachineLearning

tests = ["拉丁超立方体样本", "分数析因设计", "全因子设计", "中央复合设计", "两级全析因设计"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
