using Test
using TyOptimization

@testset "（调用接口2）具有边界约束的最小化.jl" begin
    #定义待优化函数
    f(x) = 1 + x[1] / (1 + x[2]) - 3 * x[1] * x[2] + x[2] * (1 + x[1])
    #添加边界条件
    lb = [0, 0]
    ub = [1, 2]

    bounds = [(lb[1], ub[1]), (lb[2], ub[2])]
    @test typeof(bounds) <: Vector
    x0 = (lb + ub) / 2
    @test typeof(x0) <: Vector

    constraints = []
    @test typeof(constraints) <: Vector

    #执行优化求解函数
    result = fmincon(f, x0, constraints, bounds)
    @test typeof(result) <: OptimizeResult

end