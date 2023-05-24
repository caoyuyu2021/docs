using TyMachineLearning
using CSV
using DataFrames
using Test

@testset "为多个类创建部分相关性图.jl" begin
    #读取数据集
    X, y, w = get_nlindata()
    fgdata_x1 = Matrix(X)
    fgdata_y1 = Array(y)
    X = DataFrame([fgdata_x1 fgdata_y1], :auto)
    rename!(X, [:x2 => :y])
    falimy_clsa = "GradientBoostingRegressor"
    res = nlinfit(X, falimy_clsa)
    # plotPartialDependence(res, X1, [0])
    @test res.alpha > 0
end
