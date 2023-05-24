using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "线性回归模型系数的线性假设检验.jl" begin
    #读取数据集
    file = joinpath(pkgdir(TyMachineLearning), "data/Regression/coefdata2.csv")
    coetestdata = CSV.read(file, DataFrame; header=true)
    @test size(coetestdata) == (100, 4)
    #划分数据集
    rename!(
        coetestdata, [:MPG => :Y, :Acceleration => :x1, :Model_Year => :x2, :Weight => :x3]
    )
    x = coetestdata[!, [:x1, :x2, :x3]]
    y = coetestdata[!, :Y]

    model = Mdl_coet(coetestdata)
    H = [
        [0.0 1.0 0.0 0.0]
        [0.0 0.0 1.0 0.0]
        [0.0 0.0 0.0 1.0]
    ]
    res = coeftest(model, H)
    @test res.pvalue > 0
end
