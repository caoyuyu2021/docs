using TyDeepLearning

layers = SequentialCell([
    convolution2dLayer(1, 20, 5),
    reluLayer(),
    maxPooling2dLayer(2; Stride=2),
    flattenLayer(),
    fullyConnectedLayer(20 * 14 * 14, 10),
    softmaxLayer(),
])

file = joinpath(pkgdir(TyDeepLearning), "test/Images/TrainNetworkTest/net.ckpt")
net = TyDeepLearning.load(file; net=layers)

