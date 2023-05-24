using Test

tests = ["lasso回归模型的响应预测", "拟合lasso回归模型"]

println("Runing tests:")
for t in tests
    fp = "$(t).jl"
    println("* $fp ...")
    include(fp)
end
