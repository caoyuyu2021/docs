using TyGlobalOptimization
using Test

@testset "（调用接口4）输入输出类型.jl" begin
    #定义待优化问题
    func(x) = sum(abs.(x .- (length(x):-1:1.0)))
    perm_size = 10

    @test typeof(func) <: Function
    @test typeof(perm_size) <: Int


    #执行优化求解函数
    x, fval, output = ga(func, perm_size)
    # x, fval, output
    @test typeof(x) <: Vector
    @test typeof(fval) <: Float64
    @test typeof(output) <: ga_output
end

