using Test
using TyOptimization

@testset "（调用接口1）求解具有线性不等式的 MILP.jl" begin
    f = [8; 1]
    A = [-1 -2; -4 -1; 2 1]
    b = [14; -33; 20]
    intcon = [2]
    @test typeof(A) <: Matrix
    @test typeof(b) <: Vector
    @test typeof(intcon) <: Vector

    #执行优化求解函数
    result = intlinprog(f, intcon, A, b)
    @test typeof(result) <: OptimizeResult

    showres(result)
end