using Test
using TyOptimization

@testset "（调用接口2）文件定义的函数的根.jl" begin
    #定义优化函数
    f(x) = x^3 - 2x - 5
    #添加初始条件
    bracket = [1.9, 2.1] # 在2附近的零点
    @test typeof(bracket) <: Vector

    #执行优化求解函数
    result = fzero(f, bracket)
    @test typeof(result) <: OptimizeResult

end