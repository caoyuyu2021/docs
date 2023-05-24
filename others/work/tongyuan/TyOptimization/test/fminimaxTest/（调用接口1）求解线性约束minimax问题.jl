using Test
using TyOptimization

@testset "（调用接口1）求解线性约束minimax问题.jl" begin
    #定义初始变量
    a = [1; 1]
    b = [-1; 1]
    c = [0; -1]
    a0 = 2
    b0 = -3
    c0 = 4
    #定义多目标优化函数
    function fun(x)
        return [x[1] + x[2] + a0, -x[1] + x[2] + b0, -x[2] + c0]
    end
    #添加初始条件
    A = [1 3]
    b = -4
    x0 = [-1, -2]
    @test typeof(x0) <: Vector
    ineq(x) = [b] - A*x  #不等式约束方程,>0
    constraints = [ineq_cons(ineq)]
    @test typeof(constraints) <: Vector

    #执行优化求解函数
    result = fminimax(fun, x0, constraints)   #求解计算
    @test typeof(result) <: OptimizeResult

end