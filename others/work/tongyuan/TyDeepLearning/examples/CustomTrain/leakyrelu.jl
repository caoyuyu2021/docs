# 执行leakyrelu函数操作，将其应用到数组，输出操作后的数组
X = Array{Float32}[[-1.0, 4.0, -8.0], [2.0, -5.0, 9.0]]
Y = leakyrelu(X)
print(Y)
