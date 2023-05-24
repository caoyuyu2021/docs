using TyMachineLearning
using Test
using DataFrames
using CSV

@testset "阿达分类树模板.jl" begin
    fgdata_x, fgdata_y1 = get_irsdata()
    fgdata_x1 = Matrix(fgdata_x)
    X = DataFrame([fgdata_x1 fgdata_y1], :auto)
    rename!(X, [:x5 => :y])
    n_estimators = 10
    learn_rate = 1.0
    mdl = AdaBoostTree(X, n_estimators, learn_rate)
    f = mdl.score(fgdata_x, fgdata_y1)
    # mdl.predict(fgdata_x)
    @test f > 0
end
