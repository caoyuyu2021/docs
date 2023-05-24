using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "计算部分相关性" begin
    X_reg, y_reg = get_diabetes()
    rgp_mdl = fitrgp(X_reg, y_reg)
    # partialDependence(rgp_mdl, X_reg, [0])
    @test rgp_mdl.score(X_reg, y_reg) > 0
end
