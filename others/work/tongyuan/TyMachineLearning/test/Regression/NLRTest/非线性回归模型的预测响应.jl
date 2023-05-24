using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "非线性回归模型的预测响应" begin
    X, y, w = get_nlindata()
    @test size(X) == (20, 1)
    @test size(y) == (20,)
    fgdata_x1 = Matrix(X)
    fgdata_y1 = Array(y)
    X = DataFrame([fgdata_x1 fgdata_y1], :auto)
    rename!(X, [:x2 => :y])
    falimy_clsa = "Ridge"
    mdl = nlinfit(X, falimy_clsa)
    res = TyMachineLearning.predict(mdl, w)
end
