using Test
using TyOptimization


@testset "（调用接口2）具有边界约束的最佳拟合.jl" begin
    xdata = range(0, 3, length=100)
    ydata = exp.(-1.3 * xdata) + 0.05 * randn(size(xdata))
    #优化函数
    function func(xdata, a, b)
        return a * exp.(b * xdata)
    end
    p0 = [1 / 2, -2]
    lb = [0, -2]
    ub = [3 / 4, -1]
    @test typeof(p0) <: Vector
    @test typeof(lb) <: Vector
    @test typeof(ub) <: Vector

    #执行优化求解函数
    popt, _ = lsqcurvefit(func, p0, xdata, ydata, lb, ub)
    @test typeof(popt) <: Vector

    # plot(xdata, ydata, "c*", xdata, func.(xdata, popt[1], popt[2]))
end