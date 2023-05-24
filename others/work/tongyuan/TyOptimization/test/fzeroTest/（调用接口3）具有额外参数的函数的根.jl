using Test
using TyOptimization

@testset "（调用接口3）具有额外参数的函数的根.jl" begin
    #定义优化函数
    c = 2
    f(x, c) = cos(c * x)
    #添加初始条件
    x0 = (0.1, 0.3)
    @test typeof(x0) <: Tuple

    options = optimset(solvername="fzero", args=(c,))
    @test typeof(options.args) <: Tuple

    #执行优化求解函数
    result = fzero(f, x0, options)
    @test typeof(result) <: OptimizeResult

end