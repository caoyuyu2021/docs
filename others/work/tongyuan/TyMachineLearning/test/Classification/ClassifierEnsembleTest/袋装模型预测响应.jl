using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "袋装模型预测响应.jl" begin
    fgdata_x, fgdata_y1 = get_irsdata()
    fgdata_x1 = Matrix(fgdata_x)
    X = DataFrame([fgdata_x1 fgdata_y1], :auto)
    rename!(X, [:x5 => :y])
    n_estimators = 10
    mdl = templateKernel(X, n_estimators)
    Y_LL = oobPredict(mdl, fgdata_x1)
    @test size(Y_LL) == (150,)
end