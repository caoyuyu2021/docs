using TyGlobalOptimization
using Test


@testset "（调用接口1）输入输出类型.jl" begin
    #定义待优化问题
    func(x) = exp(-x[1]^2 - x[2]^2) * (1 + 5 * x[1] + 6 * x[2] + 12 * x[1] * cos(x[2]))
    nvars = 2
    x0 = [1, -5]
    lb = [0, -Inf]
    ub = [Inf, -3]
    @test length(x0) == nvars
    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector

    #设置优化参数
    options = options_set("patternsearch")
    options.sigma = 0.5        #搜索步长设为0.5
    @test typeof(options) <: ps_options

    #执行优化求解函数
    ps_result =  patternsearch(func, nvars, x0, lb, ub, options)
    (best_x, best_y,) = ps_result
    @test typeof(best_x) <: Vector
    @test length(best_x) == nvars
end