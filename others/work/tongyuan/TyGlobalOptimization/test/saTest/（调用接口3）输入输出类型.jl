using TyGlobalOptimization
using Test

@testset "（调用接口3）输入输出类型.jl" begin
    #定义待优化问题
    function func(x)
        res = dejong5fcn(x)
        return res
    end
    x0 = [0, 0]
    lb = [-64, -64]
    ub = [64, 64]

    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector

    #设置优化问题和求解参数
    problem = sa_problem()
    problem.obj = func
    problem.x0 = x0
    problem.lb = lb
    problem.ub = ub

    @test typeof(problem) <: sa_problem

    #执行优化求解函数
    x, fval, output = simulannealbnd(problem)

    @test typeof(x) <: Vector
    @test typeof(fval) <: Float64
    @test typeof(output) <: sa_output
end

