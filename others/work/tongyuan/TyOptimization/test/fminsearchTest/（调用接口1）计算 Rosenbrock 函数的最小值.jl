using Test
using TyOptimization

@testset "（调用接口1）计算 Rosenbrock 函数的最小值.jl" begin
    #定义优化函数
    f(x) = 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
    #添加初始条件
    x0 = [-1.2, 1.0]
    @test typeof(x0) <: Vector

    #执行优化求解函数
    result = fminsearch(f, x0)
    @test typeof(result) <: OptimizeResult

end