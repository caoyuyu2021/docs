using Test
using TyOptimization

@testset "（调用接口1）求通过文件指定的函数的最小值.jl" begin
    #定义待优化函数
    function scalarobjective(x)
        f = 0
        for k = -10:10
            f = f + (k + 1)^2 * cos(k * x) * exp(-k^2 / 2)
        end
        return f
    end
    #添加边界约束
    x1 = 1.0
    x2 = 3.0
    @test typeof(x1) <: Float64
    @test typeof(x2) <: Float64

    #执行优化求解函数
    result = fminbnd(scalarobjective, x1, x2)
    @test typeof(result) <: OptimizeResult

end