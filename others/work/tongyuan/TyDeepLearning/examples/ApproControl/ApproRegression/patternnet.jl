using TyDeepLearning
file = dataset_dir("iris")
x, t = iris_dataset(file)

hiddenSizes = 10
net = patternnet(hiddenSizes,4,3)
net_trained = train(net, x, t; epochs = 5000, lr = 0.001)

y = TyDeepLearning.predict(net_trained, x)
acc = Accuracy(y, t)

hiddenSizes = 10
net = patternnet(hiddenSizes, 4, 3)
net_trained = train(net, x, t; epochs = 5000, lr = 0.001)