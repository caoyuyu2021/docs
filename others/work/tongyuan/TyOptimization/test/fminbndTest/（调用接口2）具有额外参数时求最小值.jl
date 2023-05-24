using Test
using TyOptimization

@testset "（调用接口2）具有额外参数时求最小值.jl" begin
    a = 9 / 7
    #定义待优化函数
    fx(x, a) = sin(x - a)
    #添加边界约束
    x1 = 0.0
    x2 = 2 * pi
    @test typeof(x1) <: Float64
    @test typeof(x2) <: Float64

    # 设置优化参数
    options = optimset(solvername="fminbnd", args=(a,))
    @test typeof(options.args) <: Tuple

    #执行优化求解函数
    result = fminbnd(fx, x1, x2, options)
    @test typeof(result) <: OptimizeResult

end