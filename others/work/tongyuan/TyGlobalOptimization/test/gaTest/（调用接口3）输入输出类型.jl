using TyGlobalOptimization
using Test

@testset "（调用接口3）输入输出类型.jl" begin
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

    cons_ueq(x) = -x[1] - x[2] + 1  #非线性不等式约束函数，cons_ueq(x)<=0  
    cons_eq(x) = -x[1] + x[2] - 5   #非线性等式约束函数，cons_eq(x)==0
    constraint_ueq = (cons_ueq,)
    constraint_eq = (cons_eq,)

    @test typeof(constraint_ueq) <: Tuple
    @test typeof(constraint_eq) <: Tuple

    #设置优化参数
    options = ga_options(draw_picture=true)     # 绘制迭代收敛图

    @test typeof(options) <: ga_options

    #执行优化求解函数
    x, fval, output = ga(func, lb, ub, constraint_ueq, constraint_eq, options)
    # x, fval, output
    @test typeof(x) <: Vector
    @test typeof(fval) <: Float64
    @test typeof(output) <: ga_output
end

