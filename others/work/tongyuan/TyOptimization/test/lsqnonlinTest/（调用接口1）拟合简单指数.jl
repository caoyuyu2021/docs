using Test
using TyOptimization


@testset "（调用接口1）拟合简单指数.jl" begin
    d = range(0, 3, length=100)
    y = exp.(-1.3 * d) + 0.05 * randn(size(d))
    #定义残差函数
    function func(x)
        return exp.(-d * x[1]) - y
    end

    x0 = [4]
    @test typeof(x0) <: Vector

    #执行优化求解函数
    result = lsqnonlin(func, x0)
    @test typeof(result) <: OptimizeResult

end