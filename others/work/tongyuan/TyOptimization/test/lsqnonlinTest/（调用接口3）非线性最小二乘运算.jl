using Test
using TyOptimization


@testset "（调用接口3）非线性最小二乘运算.jl" begin
    t_train = [0.9, 1.5, 13.8, 19.8, 24.1, 28.2, 35.2, 60.3, 74.6, 81.3]
    y_train = [455.2, 428.6, 124.1, 67.3, 43.2, 28.1, 13.1, -0.4, -1.3, -1.5]
    #定义残差函数
    function fun(x)         #定义残差函数
        return Array(x[1] * exp.(x[2] * t_train) - y_train)
    end

    x0 = [100.0, -1.0]
    lb = []
    ub = []
    @test typeof(x0) <: Vector
    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector

    options = optimoptions("lsqnonlin",solve_method="lm")

    #执行优化求解函数
    result = lsqnonlin(fun, x0, lb, ub, options)
    @test typeof(result) <: OptimizeResult
    x = result.x

end