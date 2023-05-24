using Test
using TyOptimization

@testset "（调用接口4）使用非默认选项求解MILP.jl" begin
    f0 = [-3; -2; -1]
    #线性不等式约束
    A = [1 1 1]
    b = [7]
    intcon = [3]
    @test typeof(A) <: Union{Matrix,Vector}
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

    options = optimoptions("intlinprog")

    options.disp = true
    @test typeof(options.disp) <: Bool


    #执行优化求解函数
    result = intlinprog(f0, intcon, A, b, Aeq, beq, lb, ub, options)
    @test typeof(result) <: OptimizeResult

end