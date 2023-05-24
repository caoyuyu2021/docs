using Test
using TyOptimization

@testset "（调用接口4）非默认选项.jl" begin
    #定义待优化函数
    f(x) = 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2
    #添加初始条件
    x0 = [0.0, 0.0]

    @test typeof(x0) <: Vector

    ineq(x) = [1 - (x[1])^2 - (x[2])^2]  #不等式约束方程,>0

    constraints = [ineq_cons(ineq)]
    @test typeof(constraints) <: Vector

    options = optimoptions("fmincon", algorithm = "trust-constr", maxiter = 5000)
    options.verbose = 3 #该参数仅支持trust-constr算法
    @test typeof(options.verbose) <: Integer

    #执行优化求解函数
    result = fmincon(f, x0, constraints, options)
    @test typeof(result) <: OptimizeResult

end