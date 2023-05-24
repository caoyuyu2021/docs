using Test
using TyOptimization  #非线性约束

@testset "输入参数个数不确定.jl" begin

    xm=[0.5000,0.2500]   #该示例matlab计算出的解

    f(x, a,b) = a * (x[2] - x[1]^2)^2 + (1 - x[1])^b

    A = []
    b = []
    Aeq = []
    beq = []
    lb = [0, 0.2]
    ub = [0.5, 0.8]

    x0 = (lb + ub) / 2

    ineq1(x) = [(1 / 3)^2 - (x[1] - 1 / 3)^2 - (x[2] - 1 / 3)^2]  #不等式约束方程,>0

    nonlcon = [ineq1, []]
    options = optimoptions("fmincon", algorithm="trust-constr", maxiter=5000)

    result = fmincon(f, x0, A, b, Aeq, beq, lb, ub, nonlcon, options, 100,2)
    @test typeof(result) <: OptimizeResult

    for i in 1:length(xm)
        @test (result.x[i] - xm[i]) / xm[i] < 0.01
    end

end
