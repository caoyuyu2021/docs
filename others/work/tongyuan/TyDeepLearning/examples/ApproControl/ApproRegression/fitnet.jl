# 函数拟合神经网络
using TyDeepLearning
x, t = simplefit_dataset()
hiddenSizes = 10
net = fitnet(hiddenSizes)
net_trained = train(net, x, t; epochs=5000, lr=0.05)
y = TyDeepLearning.predict(net_trained, x)
error = mse(t, y)
