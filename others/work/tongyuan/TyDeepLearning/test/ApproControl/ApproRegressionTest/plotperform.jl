using TyDeepLearning
using Test
using TyPlot

@testset "plotperform.jl" begin
    @testset "绘制网络性能图" begin
        TR = Dict([
            ("epoch", 100),
            ("perf", (100:-1:0)),
            ("vperf", (100:-1:0)),
            ("tperf", (100:-1:0)),
        ])
        plotperform(TR)
        @test typeof(TR["epoch"]) <: Int64
    end
end
