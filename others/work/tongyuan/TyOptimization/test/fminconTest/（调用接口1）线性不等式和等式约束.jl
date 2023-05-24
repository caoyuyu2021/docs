using Test
using TyOptimization

@testset "（调用接口1）线性不等式和等式约束.jl" begin
    #定义待优化函数
    f(x) = 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
    #添加初始条件
    x0 = [0.5, 0.0]
    @test typeof(x0) <: Vector

    ineq(x) = [1 - x[1] - 2x[2]]  #不等式约束方程,>=0
    eq(x) = [2x[1] + x[2] - 1]   #等式约束，=0

    constraints = [ineq_cons(ineq), eq_cons(eq)]
    @test typeof(constraints) <: Vector

    #执行优化求解函数
    result = fmincon(f, x0, constraints)
    @test typeof(result) <: OptimizeResult

end