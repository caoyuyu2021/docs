using Test
using TyOptimization

@testset "（调用接口1）最小化多项式.jl" begin
    #定义优化函数
    fun(x) = 3x[1]^2 + 2x[1]x[2] + x[2]^2 - 4x[1] + 5x[2]
    #添加初始条件
    x0 = [1, 1]
    @test typeof(x0) <: Vector

    #执行优化求解函数
    result = fminunc(fun, x0)
    @test typeof(result) <: OptimizeResult

end