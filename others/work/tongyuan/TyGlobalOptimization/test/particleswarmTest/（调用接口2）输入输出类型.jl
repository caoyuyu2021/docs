using TyGlobalOptimization
using Test


@testset "（调用接口2）输入输出类型.jl" begin
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

    # 非线性不等式约束函数，f_cons(x)<=0 
    f_cons(x) = (x[1] - 1)^2 + (x[2] - 0)^2 - 0.5^2
    constraint_ueq = (f_cons,)

    @test typeof(constraint_ueq) <: Tuple

    # 执行优化求解函数
    x, fval, output = particleswarm(func, lb, ub, constraint_ueq, ())

    @test typeof(x) <: Vector
    @test typeof(fval) <: Float64
    @test typeof(output) <: pso_output
end

