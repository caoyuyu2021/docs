using Test
using TyOptimization

@testset "（调用接口1）求通过文件指定的函数的最小值.jl" begin
    #定义优化函数
    function objectivefcn1(x)
        f = 0
        for k = -10:10
            f = f + exp(-(x[1] - x[2])^2 - 2 * x[1]^2) * cos(x[2]) * sin(2 * x[2])
        end
        return f
    end
    #添加初始条件
    x0 = [0.25, -0.25]
    @test typeof(x0) <: Vector

    #执行优化求解函数
    result = fminsearch(objectivefcn1, x0)
    @test typeof(result) <: OptimizeResult

end