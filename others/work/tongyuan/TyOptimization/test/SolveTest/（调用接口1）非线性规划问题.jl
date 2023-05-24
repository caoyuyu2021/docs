using Test
using TyOptimization

@testset "（调用接口1）非线性规划问题.jl" begin
    prob = optimproblem()
    f(x) = 3 * (1 - x[1])^2 * exp(-(x[1]^2) - (x[2] + 1)^2) - 10 * (x[1] / 5 - x[1]^3 - x[2]^5) * exp(-x[1]^2 - x[2]^2) - 1 / 3 * exp(-(x[1] + 1)^2 - x[2]^2)
    prob.objective = f #目标函数为peaks函数
    prob.x0 = [1, -1]
    ineq(x) = [4 - x[1]^2 - x[2]^2]   #非线性约束，>=0
    constraints = [ineq_cons(ineq)]   #定义不等式约束
    prob.constraints = constraints
    @test typeof(constraints) <: Vector
    result = Solve(prob, "fmincon")
    @test typeof(result) <: OptimizeResult

end