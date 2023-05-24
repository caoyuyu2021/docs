using TyGlobalOptimization
using Test


@testset "（调用接口2）输入输出类型.jl" begin
    # 定义待优化问题
    f1(x) = sin(x[1])
    f2(x) = cos(x[1])
    f(x) = [f1(x), f2(x)]

    # 目标函数个数
    nobj = 2

    # 不等式和等式约束
    constraint_ueq = ()
    constraint_eq = ()

    # 打包函数
    objcon = packfcn(f, constraint_ueq, constraint_eq)


    # 添加边界约束
    lb = zeros(1)                   # 行向量，元素个数代表决策变量维数
    ub = ones(1) * 2 * pi

    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector


    # 设置优化问题和求解参数
    problem = gamultiobj_problem()
    problem.objcon = objcon
    problem.nobj = nobj
    problem.lb = lb
    problem.ub = ub

    @test typeof(problem) <: gamultiobj_problem

    # 执行优化求解函数
    PS, PF, output = gamultiobj(problem)

    @test size(PS) == (length(lb), problem.options.N)
    @test typeof(PF) <: Matrix
    @test typeof(output) <: gamultiobj_output
end

