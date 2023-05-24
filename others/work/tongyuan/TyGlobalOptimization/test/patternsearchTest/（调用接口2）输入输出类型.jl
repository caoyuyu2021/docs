using Test

@testset "（调用接口2）输入输出类型.jl" begin

    func(x) = exp(-x[1]^2 - x[2]^2) * (1 + 5 * x[1] + 6 * x[2] + 12 * x[1] * cos(x[2]))
    problem = problem_set("patternsearch")
    problem.func = func
    problem.nvars = 2
    problem.x0 = [1, -5]
    problem.lb = [0, -Inf]
    problem.ub = [Inf, -3]

    @test typeof(problem) <: ps_problem

    #执行优化求解函数
    ps_result = patternsearch(problem)
    (best_x, best_y,) = ps_result
    @test typeof(best_x) <: Vector
    @test length(best_x) == problem.nvars
end

