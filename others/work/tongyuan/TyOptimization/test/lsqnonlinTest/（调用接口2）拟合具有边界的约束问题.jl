using Test
using TyOptimization


@testset "（调用接口2）拟合具有边界的约束问题.jl" begin
    t = range(-4, 4, length=100)
    y = 1 / sqrt(2 * pi) * exp.(-t .^ 2 / 2)
    #定义残差函数
    function func(x)
        return x[1] * exp.(-t) .* exp.(-exp.(-(t .- x[2]))) - y
    end

    x0 = [1 / 2, 0]
    @test typeof(x0) <: Vector
    lb = [1 / 2, -1]
    ub = [3 / 2, 3]
    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector

    #执行优化求解函数
    result = lsqnonlin(func, x0, lb, ub)
    @test typeof(result) <: OptimizeResult

end