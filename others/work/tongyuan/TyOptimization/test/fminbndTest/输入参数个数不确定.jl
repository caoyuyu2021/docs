using Test
using TyOptimization  #传入目标函数额外参数，参数个数不确定

@testset "输入参数个数不确定.jl" begin

    xm=5.9981   #matlab计算结果

    H = 9 / 7
    fx(x, a) = sin(x - a) #定义优化目标函数，包含参数
    x1 = 0.0 #定义上界
    x2 = 2 * pi #定义下界 
    options = optimset(; solvername="fminbnd")  #创建优化设置选项类
    result = fminbnd(fx, x1, x2, options, H) #调用优化算法函数
    @test typeof(result) <: OptimizeResult
    @test (result.x-5.9981)/5.9981<0.01
end


