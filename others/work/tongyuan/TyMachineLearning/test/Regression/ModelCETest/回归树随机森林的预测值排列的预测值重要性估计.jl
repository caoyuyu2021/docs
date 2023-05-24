using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "回归树随机森林的预测值排列的预测值重要性估计" begin
    #读取数据集
    file1 = joinpath(pkgdir(TyMachineLearning), "data/Regression/oob.csv")
    data = CSV.read(file1, DataFrame; header=1)
    @test size(data) == (100, 8)
    list_name = "Mfg"
    X1, y1, convs = convent_columns(data, list_name)
    #划分数据集
    fgdata_x1 = Matrix(X1.values)
    fgdata_y1 = Array(y1.values)
    X = DataFrame([fgdata_x1 fgdata_y1], :auto)
    rename!(X, [:x8 => :y])
    falimy_clsa = "RandomForestRegressor"
    mdl = nlinfit(X, falimy_clsa)
    res = oobPermutedPredictorImportance(mdl)
    @test size(res) == (7,)
end
