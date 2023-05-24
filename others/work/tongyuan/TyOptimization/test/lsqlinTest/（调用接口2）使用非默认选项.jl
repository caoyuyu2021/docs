using Test
using TyOptimization

@testset "（调用接口2）使用非默认选项.jl" begin
    C = [0.9501 0.7620 0.6153 0.4057
        0.2311 0.4564 0.7919 0.9354
        0.6068 0.0185 0.9218 0.9169
        0.4859 0.8214 0.7382 0.4102
        0.8912 0.4447 0.1762 0.8936]
    d = [0.0578
        0.3528
        0.8131
        0.0098
        0.1388]
    lb = -0.1 * ones(4)
    ub = 2 * ones(4)
    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector

    options = optimoptions("lsqlin")

    options.verbose = 2
    @test typeof(options.verbose) <: Integer

    #执行优化求解函数
    result = lsqlin(C, d, lb, ub, options)
    @test typeof(result) <: OptimizeResult

end