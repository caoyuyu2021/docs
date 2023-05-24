using Test
using TyOptimization

@testset "（调用接口1）sin最小值.jl" begin
    #定义待优化函数
    f(x) = sin(x)
    #添加边界约束
    x1 = 0.0
    x2 = 2 * pi
    @test typeof(x1) <: Float64
    @test typeof(x2) <: Float64

    #执行优化求解函数
    result = fminbnd(f, x1, x2)
    @test typeof(result) <: OptimizeResult

end