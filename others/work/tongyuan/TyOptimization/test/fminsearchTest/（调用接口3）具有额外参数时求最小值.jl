using Test
using TyOptimization

@testset "（调用接口3）具有额外参数时求最小值.jl" begin
    #定义优化函数
    f(x, a) = 100 * (x[2] - x[1]^2)^2 + (a - x[1])^2
    #添加初始条件
    x0 = [-1, 1.9]
    @test typeof(x0) <: Vector

    options = optimoptions("fminsearch")
    options.args = (3,)
    @test typeof(options.args) <: Tuple

    #执行优化求解函数
    result = fminsearch(f, x0, options)
    @test typeof(result) <: OptimizeResult

end
