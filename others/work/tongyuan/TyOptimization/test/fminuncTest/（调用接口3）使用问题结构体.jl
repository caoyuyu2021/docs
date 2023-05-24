using Test
using TyOptimization

@testset "（调用接口3）使用问题结构体.jl" begin
    #定义优化函数
    f(x) = 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2                                  #优化目标函数
    g(x) = [-400 * (x[2] - x[1]^2) * x[1] - 2 * (1 - x[1]), 200 * (x[2] - x[1]^2)] #目标函数梯度

    func(x) = (f(x), g(x))
    #添加初始条件
    x0 = [-1, 2]
    @test typeof(x0) <: Vector

    options = optimoptions("fminunc")
    options.jac = true
    @test typeof(options.jac) <: Bool

    prob = optimproblem()
    prob.objective = func
    prob.options = options
    prob.x0 = x0

    #执行优化求解函数
    result = fminunc(prob)
    @test typeof(result) <: OptimizeResult

end