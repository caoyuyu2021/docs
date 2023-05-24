using TyGlobalOptimization
using Test

@testset "（调用接口2）输入输出类型.jl" begin
    #定义待优化问题
    function objcon(x)
        #2个目标
        fx1 = sin(x[1])
        fx2 = cos(x[1])
        fx = [fx1, fx2]
        #约束
        gx = [0.0] #不等式约束表达式，gx(x)<=0，为0.0，代表无不等式约束
        return fx, gx
    end
    #添加边界约束
    lb = zeros(1)      #行向量，元素个数代表决策变量维数
    ub = ones(1) * 2 * pi
    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector

    x0 = (lb + ub) / 2
    @test typeof(x0) <: Vector
    @test length(x0) == length(lb)
    #设置优化问题和求解参数
    problem = problem_set("paretosearch")
    problem.objcon = objcon
    problem.x0 = x0
    problem.lb = lb
    problem.ub = ub

    @test typeof(problem) <: paretosearch_problem

    #执行优化求解函数
    (ParetoSolution, ParetoFront) = paretosearch(problem)

    @test length(ParetoSolution[:, 1]) == length(problem.lb)
    @test typeof(ParetoSolution[:, 1]) <: Vector
end

