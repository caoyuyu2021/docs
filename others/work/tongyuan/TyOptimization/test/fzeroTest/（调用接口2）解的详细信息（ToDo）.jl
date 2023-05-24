using Test
using TyOptimization

@testset "（调用接口2）解的详细信息（ToDo）.jl" begin
    #定义优化函数
    f(x) = exp(-exp(-x)) - x
    #添加初始条件
    bracket = [0, 1]
    @test typeof(bracket) <: Vector

    #执行优化求解函数
    result = fzero(f, bracket)
    @test typeof(result) <: OptimizeResult

end