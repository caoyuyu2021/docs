using Test
using TyOptimization

@testset "（调用接口4）使用“interior-point”算法的线性规划.jl" begin
    f0 = [-1, -1 / 3]
    @test typeof(f0) <: Vector
    A = [1 1; 1 1/4; 1 -1; -1/4 -1; -1 -1; -1 1]
    b = [2, 1, 2, 1, -1, 2]
    @test typeof(A) <: Union{Matrix,Vector}
    @test typeof(b) <: Vector

    #线性等式约束
    Aeq = [1 1 / 4]
    beq = [1 / 2]
    @test typeof(Aeq) <: Union{Matrix,Vector}
    @test typeof(beq) <: Vector

    #边界约束
    lb = [-1, -0.5]
    ub = [1.5, 1.25]
    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector

    options = optimoptions("linprog", algorithm="highs-ipm", maxiter=1000)
    options.disp = false
    @test typeof(options.disp) <: Bool

    #执行优化求解函数
    result = linprog(f0, A, b, Aeq, beq, lb, ub, options)
    @test typeof(result) <: OptimizeResult

end