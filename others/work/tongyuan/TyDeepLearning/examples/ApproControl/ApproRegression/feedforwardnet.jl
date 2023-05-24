# 生成前馈神经网络
using TyDeepLearning
using TyDeepLearning
file = dataset_dir("simplefit")
x, t = simplefit_dataset(file)
hiddenSizes = 10
net = feedforwardnet(hiddenSizes)
net_trained = train(net, x, t; epochs=5000, lr=0.05)
y = TyDeepLearning.predict(net_trained, x)
error = mse(t, y)
