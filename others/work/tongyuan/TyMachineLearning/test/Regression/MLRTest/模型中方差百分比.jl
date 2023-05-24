using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "模型中方差百分比" begin
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/example_NIR.csv")
    file4 = joinpath(pkgdir(TyMachineLearning), "data/Regression/example_octane.csv")
    NIR_data = CSV.read(file1, DataFrame; header=false)
    octane_data = CSV.read(file4, DataFrame; header=false)
    X = NIR_data
    y = octane_data
    lr, XL, YL = plsregress(X, y, 10)
    XS = lr.x_scores_
    YS = lr.y_scores_
    XP, YP = plspctvar(XS, YS)
    @test XP[1] > 0
end
