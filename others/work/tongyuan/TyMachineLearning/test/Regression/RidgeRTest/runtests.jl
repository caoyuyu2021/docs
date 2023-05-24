using Test

tests = ["拟合ridge回归模型", "ridge回归模型的响应预测"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
