using TyGlobalOptimization
using Test

@testset "（调用接口1）输入输出类型.jl" begin
    #定义待优化问题
    function objcon(x)
        #2个目标
        fx1 = sin(x[1])
        fx2 = cos(x[1])
        fx = [fx1, fx2]
        #约束
        gx = [0.0] #不等式约束表达式，gx(x)<=0，为0.0，代表无不等式约束
        return fx, gx
    end
    #添加边界约束
    lb = zeros(1)      #行向量，元素个数代表决策变量维数
    ub = ones(1) * 2 * pi
    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector
  
    x0 = (lb + ub) / 2
    @test typeof(x0) <: Vector
    @test length(x0) == length(lb)

    #设置优化参数
    options = options_set("paretosearch")
    options.step_size = 0.3  #设置变异概率为0.1
    @test typeof(options) <: paretosearch_options

    #执行优化求解函数
    (ParetoSolution, ParetoFront) = paretosearch(objcon, x0, lb, ub, options)

    @test length(ParetoSolution[:, 1]) == length(lb)
    @test typeof(ParetoSolution[:, 1]) <: Vector
end