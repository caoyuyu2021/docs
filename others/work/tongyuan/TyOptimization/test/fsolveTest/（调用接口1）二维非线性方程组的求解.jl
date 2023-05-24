using Test
using TyOptimization

@testset "（调用接口1）二维非线性方程组的求解.jl" begin
    #定义优化函数
    function fun(x)
        return exp(-exp(-(x[1] + x[2]))) - x[2] * (1 + x[1] * x[1]), x[1] * cos(x[2]) + x[2] * sin(x[1]) - 0.5
    end
    #添加初始条件
    x0 = [0, 0]
    @test typeof(x0) <: Vector

    #执行优化求解函数
    result = fsolve(fun, x0)
    @test typeof(result) <: OptimizeResult

end