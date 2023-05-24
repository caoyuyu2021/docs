using Test
using TyMachineLearning
using CSV
using DataFrames

@testset "估计交叉验证的分类错误.jl" begin
    #读取数据集
    fgdata_x, fgdata_y1 = get_irsdata()
    fgdata_x1 = Matrix(fgdata_x)
    X = DataFrame([fgdata_x1 fgdata_y1], :auto)
    rename!(X, [:x5 => :y])
    X_pre, y_pre = dropna(X)
    #训练模型
    mdl = fitcdiscr(X_pre, y_pre)
    cv = 10
    res = kfoldPredict(mdl, X_pre, y_pre, cv)
    @test length(res) == 150
end
