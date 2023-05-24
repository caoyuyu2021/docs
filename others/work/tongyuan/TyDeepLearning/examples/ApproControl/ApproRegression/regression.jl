# 拟合线性回归模型
using TyDeepLearning
x, t = simplefit_dataset()
hiddenSizes = 10
net = feedforwardnet(hiddenSizes)
net_trained = train(net, x, t; epochs=5000, lr=0.05)
y = TyDeepLearning.predict(net_trained, x)
t = reshape(t, 94)
y = reshape(y, 94)
r, m, b = regression(t, y)
