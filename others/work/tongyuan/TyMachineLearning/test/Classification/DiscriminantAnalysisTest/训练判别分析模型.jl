using Test
using TyMachineLearning
using CSV
using DataFrames

@testset "训练判别分析模型.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    fgdata_x1 = Matrix(fgdata_x)
    X = DataFrame([fgdata_x1 fgdata_y1], :auto)
    rename!(X, [:x5 => :y])
    X_pre, y_pre = dropna(X)
    mdl = fitcdiscr(X_pre, y_pre)
    f = TyMachineLearning.predict(mdl, X_pre)
    @test size(f) == (150,)
end
