using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "计算部分相关性" begin
    X, y, w = get_nlindata()
    fgdata_x1 = Matrix(X)
    fgdata_y1 = Array(y)
    X = DataFrame([fgdata_x1 fgdata_y1], :auto)
    rename!(X, [:x2 => :y])
    falimy_clsa = "GradientBoostingRegressor"
    res = nlinfit(X, falimy_clsa)
    # partialDependence_py(res, X1, [0])
    @test res.alpha > 0
end
