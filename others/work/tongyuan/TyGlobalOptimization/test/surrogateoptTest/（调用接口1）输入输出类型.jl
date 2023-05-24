using TyGlobalOptimization
using Test


@testset "（调用接口1）输入输出类型.jl" begin

    #定义待优化问题
    obj = x -> (4 * x[1] .^ 2 - 2.1 * x[1] .^ 4 + x[1] .^ 6 / 3 + x[1] .* x[2] - 4 * x[2] .^ 2 + 4 * x[2] .^ 4)
    lb = [-2.1, -2.1]
    ub = -lb

    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector

    #设置优化参数
    options = options_set("surrogateopt")
    options.maxiters = 1000
    @test typeof(options) <: surr_options

    #执行优化求解函数
    surr_result = surrogateopt(obj, lb, ub, options) 
    (best_x,best_y) = surr_result
    @test typeof(surr_result) <: Tuple
    @test length(best_x) == length(lb)
end