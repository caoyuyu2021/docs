using Test
using TyMachineLearning
using CSV
using DataFrames

@testset "使用半监督自训练在标记和未标记数据上训练的模型对新数据进行分类.jl" begin
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
    file4 = joinpath(pkgdir(TyMachineLearning), "data/Classification/newX.csv")
    newX = CSV.read(file4, DataFrame; header=false)
    @test size(newX) == (150, 2)
    #训练模型
    mdl, Unlabeledy = fitsemiself(X, y, UnlabeledX)
    X1 = Array(newX)
    @test length(TyMachineLearning.predict(mdl, X1)) == size(X1, 1)
end
