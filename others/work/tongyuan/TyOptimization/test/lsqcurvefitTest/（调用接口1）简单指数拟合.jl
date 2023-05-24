using Test
using TyOptimization


@testset "（调用接口1）简单指数拟合.jl" begin
    t_train = [0.9, 1.5, 13.8, 19.8, 24.1, 28.2, 35.2, 60.3, 74.6, 81.3]
    y_train = [455.2, 428.6, 124.1, 67.3, 43.2, 28.1, 13.1, -0.4, -1.3, -1.5]
    #优化函数
    function func(xdata, a, b)
        return a * exp.(b * xdata)
    end
    p0 = [100.0, -1.0]
    @test typeof(p0) <: Vector

    #执行优化求解函数
    popt, _ = lsqcurvefit(func, p0, t_train, y_train)
    @test typeof(popt) <: Vector{Float64}

    #绘图
    # times = range(t_train[1], step=0.5, stop=t_train[10])
    # plot(t_train, y_train, "co", times, func.(times, popt[1], popt[2]))
end