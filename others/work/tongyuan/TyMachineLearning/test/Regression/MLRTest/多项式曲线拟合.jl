using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "多项式曲线拟合" begin
    #获取poly数据
    X_train, X_test, y = get_datapoly()
    lr, x1, y = TyMachineLearning.polyfit(X_train, y, 7)
    res = lr.coef_
    @test size(res) == (8,)
end
