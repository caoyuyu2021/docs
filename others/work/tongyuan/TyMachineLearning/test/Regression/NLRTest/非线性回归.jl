using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "非线性回归" begin
    X, y, w = get_nlindata()
    fgdata_x1 = Matrix(X)
    fgdata_y1 = Array(y)
    X = DataFrame([fgdata_x1 fgdata_y1], :auto)
    rename!(X, [:x2 => :y])
    falimy_clsa = "Ridge"
    res = nlinfit(X, falimy_clsa)
    @test res.alpha > 0
end
