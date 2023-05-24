using Test

# 允许在测试项目中通过 artifact"..." 来获取路径
cp(joinpath(@__DIR__, "..", "Artifacts.toml"), joinpath(@__DIR__, "Artifacts.toml"))
atexit(() -> rm(joinpath(@__DIR__, "Artifacts.toml")))

tests = [
    "Images/LayersTest/runtests",
    "Images/DAGTest/runtests",
    "Images/PredictionTest/runtests",
    "Images/TrainNetworkTest/runtests",
    "Images/PreImagesTest/runtests",
    "SeqText/LayersTest/runtests",
    "CustomTrain/Operations test/runtests",
    "ApproControl/ApproRegressionTest/runtests",
    "ApproControl/AutoencodersTest/runtests",
]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end

