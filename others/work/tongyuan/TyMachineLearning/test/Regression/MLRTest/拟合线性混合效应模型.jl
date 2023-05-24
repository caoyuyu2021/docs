using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "拟合线性混合效应模型.jl" begin
    #读取数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/MXL_data.csv")
    lasdata_x = CSV.read(file1, DataFrame; header=1)
    formula = "CityMPG~Horsepower"
    group = "EngineType"
    res = fitlme(lasdata_x, formula, group)
    @test res.pvalues.Horsepower > 0
end
