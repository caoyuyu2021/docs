using Test

tests = [
    "t分布随机邻居嵌入",
    "局部切线空间对齐LTSA",
    "局部线性嵌入LLE",
    "改进局部线性嵌入MLLE",
    "等距映射",
    "非线性降维的光谱嵌入SE",
    "黑森特征映射HE",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
