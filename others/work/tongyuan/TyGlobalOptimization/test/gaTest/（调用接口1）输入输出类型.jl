using TyGlobalOptimization
using Test

@testset "（调用接口1）输入输出类型.jl" begin
    #定义待优化问题
    function func(p)
        x1, x2 = p
        return ps_example([x1 x2])[1]
    end
    lb = [1.0, -3.0]
    ub = [6.0, 8.0]
    @test typeof(func) <: Function
    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector

    #执行优化求解函数
    x,fval,output = ga(func, lb, ub)
    # x, fval, output
    @test typeof(x) <: Vector
    @test typeof(fval) <:Float64
    @test typeof(output) <: ga_output
end




