using Test
using TyOptimization

@testset "（调用接口1）非负线性最小二乘.jl" begin
    C = [0.0372 0.2869
        0.6861 0.7071
        0.6233 0.6245
        0.6344 0.6170]

    d = [0.8587
        0.1781
        0.0747
        0.8405]
    @test typeof(C) <: Matrix
    @test typeof(d) <: Vector

    #执行优化求解函数
    x, resnorm = TyOptimization.lsqnonneg(C, d)
    @test typeof(x) <: Vector

end