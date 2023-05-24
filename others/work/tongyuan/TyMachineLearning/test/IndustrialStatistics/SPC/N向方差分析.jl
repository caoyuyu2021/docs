using Test
using CSV
using DataFrames
using PyCall

@testset "N向方差分析.jl" begin
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
