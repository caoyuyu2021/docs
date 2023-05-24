using Test
using TyOptimization

@testset "（调用接口2）非线性约束.jl" begin
    #定义待优化函数
    f(x) = 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
    #添加边界条件
    lb = [0, 0.2]
    ub = [0.5, 0.8]

    bounds = [(lb[1], ub[1]), (lb[2], ub[2])]
    @test typeof(bounds) <: Vector
    x0 = (lb + ub) / 2
    @test typeof(x0) <: Vector

    ineq(x) = [(1 / 3)^2 - (x[1] - 1 / 3)^2 - (x[2] - 1 / 3)^2]  #不等式约束方程,>0

    constraints = [ineq_cons(ineq)]
    @test typeof(constraints) <: Vector

    #执行优化求解函数
    result = fmincon(f, x0, constraints, bounds)
    @test typeof(result) <: OptimizeResult

end