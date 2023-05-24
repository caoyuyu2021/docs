# 绘制线性回归图
using TyDeepLearning
x, t = simplefit_dataset()
hiddenSizes = 10
net = feedforwardnet(hiddenSizes)
net_trained = train(net, x, t; epochs=5000, lr=0.05)
y = TyDeepLearning.predict(net_trained, x)
plotregression(t, y)
