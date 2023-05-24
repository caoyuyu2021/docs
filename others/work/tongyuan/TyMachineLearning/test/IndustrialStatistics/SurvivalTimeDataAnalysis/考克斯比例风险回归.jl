using Test
using CSV
using DataFrames
using PyCall
using TyMachineLearning

@testset "考克斯比例风险回归.jl" begin
    #读取数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Industrial_Statistics/cox.csv")
    fgdata_x = CSV.read(file1, DataFrame; header=0)
    rename!(fgdata_x, [:Column1 => :"gtv", :Column2 => :"name", :Column3 => :"env"])
    @test size(fgdata_x) == (100, 3)
    X = fgdata_x
    #name1是死亡时间列名
    name1 = "gtv"
    #name1是代表是否观察到“死亡”的列名，1代表观测到了，0代表未观测
    name2 = "env"
    coxmdl = TyMachineLearning.coxphfit(X, name1, name2)
    @test coxmdl.params_[0] > 0
end
