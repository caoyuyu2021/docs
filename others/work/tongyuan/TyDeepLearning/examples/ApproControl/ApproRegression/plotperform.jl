# 绘制网络性能图
using TyDeepLearning
TR = Dict([
        ("epoch", 100),
        ("perf", (100:-1:0)),
        ("vperf", (100:-1:0)),
        ("tperf", (100:-1:0))
    ])
plotperform(TR)