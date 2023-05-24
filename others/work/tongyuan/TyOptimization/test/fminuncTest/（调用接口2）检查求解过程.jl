using Test
using TyOptimization

@testset "（调用接口2）检查求解过程.jl" begin
    #定义优化函数
    fun(x) = x[1] * exp(-(x[1]^2 + x[2]^2)) + (x[1]^2 + x[2]^2) / 20
    #添加初始条件
    x0 = [1, 2]
    @test typeof(x0) <: Vector

    options = optimoptions("fminunc")
    options.jac = None()
    options.iprint = 1 #打印迭代求解过程

    #执行优化求解函数
    result = fminunc(fun, x0, options)
    @test typeof(result) <: OptimizeResult

end