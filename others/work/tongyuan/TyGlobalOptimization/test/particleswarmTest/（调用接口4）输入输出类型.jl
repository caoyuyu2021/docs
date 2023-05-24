using TyGlobalOptimization
using Test
using TyMath

@testset "（调用接口4）输入输出类型.jl" begin
    # 定义待优化问题
    function func(x)
        x1, x2 = x
        return -20 * exp(-0.2 * sqrt(0.5 * (x1^2 + x2^2))) - exp(
                   0.5 * (cos(2 * pi * x1) + cos(2 * pi * x2))) + 20 + ℯ
    end

    lb = [-6.0, -4.0]
    ub = [2.0, 4.0]
    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector

    # 设置优化问题和求解参数
    problem = pso_problem()
    problem.obj = func
    problem.lb = lb
    problem.ub = ub
    @test typeof(problem) <: pso_problem

    # 执行优化求解函数
    x, fval, output = particleswarm(problem)

    @test typeof(x) <: Vector
    @test typeof(fval) <: Float64
    @test typeof(output) <: pso_output
end

