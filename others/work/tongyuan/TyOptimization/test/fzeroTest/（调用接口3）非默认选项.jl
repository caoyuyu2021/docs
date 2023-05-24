using Test
using TyOptimization

@testset "（调用接口3）非默认选项.jl" begin
    #定义优化函数
    f(x) = sin(cosh(x))
    #添加初始条件
    x0 = (1, 2)
    @test typeof(x0) <: Tuple

    options = optimset(solvername="fzero")
    options.args = ()
    options.maxiter = 100
    @test typeof(options.args) <: Tuple
    @test typeof(options.maxiter) <: Integer

    #执行优化求解函数
    result = fzero(f, x0, options)
    @test typeof(result) <: OptimizeResult

    #=
    Dict{Any, Any} with 5 entries:
    "是否收敛"  => true
    "求解算法"  => "secant"
    "总迭代次数… => 6
    " 函数计算… => 7
    "求解结果x… => 1.81153
    =#

end