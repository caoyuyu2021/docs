using TyGlobalOptimization
using Test


@testset "（调用接口1）输入输出类型.jl" begin
    #定义待优化问题
    func(x) = x[1]^2 + 4 * sin(5 * x[1])

    lb = [-5]
    ub = [5]

    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector

    #执行优化求解函数
    x, fval, ret = multistart(func, lb, ub)

    @test typeof(x) <: Vector
    @test typeof(fval) <: Float64
    @test typeof(ret) <: Symbol
end