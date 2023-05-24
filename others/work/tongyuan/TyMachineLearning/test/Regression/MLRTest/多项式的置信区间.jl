using Test
using CSV
using DataFrames
using TyMachineLearning

@testset "多项式的置信区间" begin
    #获取poly数据
    X_train, X_test, y = get_datapoly()
    y_pre, ci = polyconf(X_train, X_test, y, 7, 0.95)
    @test ci[2] > 0
end
