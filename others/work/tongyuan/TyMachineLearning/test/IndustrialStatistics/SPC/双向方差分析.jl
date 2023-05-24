using Test
using CSV
using DataFrames
using PyCall

@testset "双向方差分析.jl" begin
    # data2 = [
    #     5.5000 4.5000 3.5000
    #     5.5000 4.5000 4.0000
    #     6.0000 4.0000 3.0000
    #     6.5000 5.0000 4.0000
    #     7.0000 5.5000 5.0000
    #     7.0000 5.0000 4.5000
    # ]
    # X = DataFrame(data2, :auto)
    # rename!(X, [:x3 => :y])
    # modelspec2 = "y ~ C(x1)+C(x2)+C(x1):C(x2)"
    # model, x_pre, y_pre = fitlm(X, modelspec2)
    # typ2 = 2
    # res2 = anova2(model, typ2)
    # p = res2.values[1:3, 4]
    # @test p[1] > 0
    data = DataFrame(;
        g1=[1, 2, 1, 2, 1, 2, 1, 2],
        g2=["hi", "hi", "lo", "lo", "hi", "hi", "lo", "lo"],
        g3=["may", "may", "may", "may", "june", "june", "june", "june"],
        y=[52.7, 57.5, 45.9, 44.5, 53.0, 57.0, 45.9, 44.0],
    )
    rename!(data, [:y => :Y, :g1 => :x1, :g2 => :x2, :g3 => :x3])
    modelspec = "Y ~ x1+x2+x3"
    model, x_pre, y_pre = fitlm(data, modelspec)
    typ = 2
    res = anovan(model, typ)
    p = res.values[1:3, end]
    @test p[2] > 0
end
