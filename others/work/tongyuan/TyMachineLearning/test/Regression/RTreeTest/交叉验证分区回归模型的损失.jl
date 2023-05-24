using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "交叉验证分区回归模型的损失" begin
    fgdata_x, fgdata_y1 = get_irsdata()
    rtree = fitrtree(fgdata_x, fgdata_y1)
    X_test = fgdata_x
    tmm2 = TyMachineLearning.predict(rtree, X_test)
    y_true = fgdata_y1
    y_pred = tmm2
    ls1 = kfoldLoss(y_true, y_pred)
    @test ls1 >= 0
end