using Test
using TyOptimization

@testset "（调用接口3）求解具有所有类型约束的MILP.jl" begin
    f = [-3; -2; -1]
    #线性不等式约束
    A = [1 1 1]
    b = [7]
    intcon = [3]
    @test typeof(A) <: Matrix
    @test typeof(b) <: Vector
    @test typeof(intcon) <: Vector

    #线性等式约束
    Aeq = [4 2 1]
    beq = [12]
    @test typeof(Aeq) <: Matrix
    @test typeof(beq) <: Vector

    #边界约束
    lb = zeros(3)
    ub = [Inf, Inf, 1]
    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector

    #执行优化求解函数
    result = intlinprog(f, intcon, A, b, Aeq, beq, lb, ub)
    @test typeof(result) <: OptimizeResult

end