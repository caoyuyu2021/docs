using Test
using TyMachineLearning
using CSV
using DataFrames

@testset "基于半监督自训练拟合未标记的数据.jl" begin
    #读取数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Classification/labeledX.csv")
    X = CSV.read(file1, DataFrame; header=false)
    @test size(X) == (60, 2)
    file2 = joinpath(pkgdir(TyMachineLearning), "data/Classification/Y.csv")
    y = CSV.read(file2, DataFrame; header=false)
    @test size(y) == (60, 1)
    file3 = joinpath(pkgdir(TyMachineLearning), "data/Classification/unlabeledX.csv")
    UnlabeledX = CSV.read(file3, DataFrame; header=false)
    @test size(UnlabeledX) == (300, 2)
    #训练模型
    mdl, Unlabeledy = fitsemiself(X, y, UnlabeledX)
    @test typeof(mdl) <: PyObject
    @test length(Unlabeledy) == size(UnlabeledX, 1)
end
