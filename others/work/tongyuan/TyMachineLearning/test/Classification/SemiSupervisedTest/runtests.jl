using Test

tests = [
    "基于半监督图拟合未标记的数据",
    "基于半监督自训练拟合未标记的数据",
    "使用半监督图在标记和未标记数据上训练的模型对新数据进行分类",
    "使用半监督自训练在标记和未标记数据上训练的模型对新数据进行分类",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
