using Test
using TyOptimization

@testset "（调用接口1）一个初始点处的根.jl" begin
    #定义优化函数
    f(x) = sin(x)
    #添加初始条件
    x0 = (3 - 0.1, 3 + 0.1)
    @test typeof(x0) <: Tuple

    #执行优化求解函数
    result = fzero(f, x0)
    @test typeof(result) <: OptimizeResult
  
end