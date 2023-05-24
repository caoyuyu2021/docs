using TyGlobalOptimization
using Test


@testset "（调用接口2）输入输出类型.jl" begin
    #定义待优化问题
    function func(x)
        res = dejong5fcn(x)
        return res
    end
    x0 = [0, 0]
    lb = [-64, -64]
    ub = [64, 64]
    
    @test length(x0) == length(lb)
    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector

    #设置优化参数
    options = sa_options(draw_picture=true)     # 绘制迭代收敛图

    @test typeof(options) <: sa_options

    #执行优化求解函数
    x, fval, output = simulannealbnd(func, x0, lb, ub, options)

    @test typeof(x) <: Vector
    @test typeof(fval) <: Float64
    @test typeof(output) <: sa_output
end