using Test
using TyOptimization

@testset "（调用接口3）具有所有约束类型的线性规划.jl" begin

    #MATLAB软件的解
    xm = [0.1875, 1.2500]

    f = [-1, -1 / 3]
    @test typeof(f) <: Vector
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

    #执行优化求解函数
    result = linprog(f, A, b, Aeq, beq, lb, ub)
    @test typeof(result) <: OptimizeResult

    for i in 1:length(xm)
        if xm[i] == 0
            @test abs(result.x[i] - xm[i]) < 0.001
        else
            @test abs(result.x[i] - xm[i]) / xm[i] < 0.001
        end
    end
end