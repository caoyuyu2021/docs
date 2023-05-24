using Test
using TyOptimization

@testset "（调用接口2）某初始区间内的根.jl" begin
    #定义优化函数
    f(x) = cos(x)
    #添加初始条件
    bracket = [1, 2]
    @test typeof(bracket) <: Vector

    #执行优化求解函数
    result = fzero(f, bracket)
    @test typeof(result) <: OptimizeResult

end