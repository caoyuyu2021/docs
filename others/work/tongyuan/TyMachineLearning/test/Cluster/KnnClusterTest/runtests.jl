using Test

tests = ["生成默认的Kd树", "查找最近的邻居", "使用Kd-tree和穷举搜索在半径内搜索邻居", "创建最近邻搜索器对象"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
