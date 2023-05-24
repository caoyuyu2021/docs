using Test
using TyOptimization

@testset "（调用接口4）使用梯度.jl" begin
    #定义待优化函数
    f(x) = 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
    g(x) = [-400 * (x[2] - x[1]^2) * x[1] - 2 * (1 - x[1]), 200 * (x[2] - x[1]^2)] #目标函数梯度
    func(x) = (f(x), g(x))
    #添加边界条件
    lb = [-2, -2]
    ub = [2, 2]
    bounds = [(lb[1], ub[1]), (lb[2], ub[2])]

    x0 = [-1, 2]
    @test typeof(x0) <: Vector

    constraints = []
    @test typeof(constraints) <: Vector

    options = optimoptions("fmincon")
    options.jac = true
    options.bounds = bounds
    @test typeof(options.bounds) <: Vector

    #执行优化求解函数
    result = fmincon(func, x0, constraints, options)
    @test typeof(result) <: OptimizeResult

end