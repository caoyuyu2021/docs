using Test
using TyOptimization


@testset "（调用接口2）最小化sin和cos的最大值.jl" begin
    #定义多目标优化函数
    function f(x)
        return [sin(x[1]), cos(x[1])]
    end

    #添加初始条件
    bounds = [(-pi, pi)]   #定义边界
    @test typeof(bounds) <: Vector
    x0 = [1]              #给初始值
    @test typeof(x0) <: Vector
    constraints = []     #约束为空
    @test typeof(constraints) <: Vector


    #执行优化求解函数
    result = fminimax(f, x0, constraints, bounds)   #求解计算
    @test typeof(result) <: OptimizeResult

end