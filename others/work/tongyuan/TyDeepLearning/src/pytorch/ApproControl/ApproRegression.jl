function fitnet(hiddenSizes; LossFun = "MSE")
    net, LossFun = feedforwardnet(hiddenSizes; LossFun = LossFun)

    return net, LossFun

end

function feedforwardnet(hiddenSizes, inputsize = 1, outputsize = 1; LossFun ="MSE")

    n = length(hiddenSizes)
    if n == 1
        net = Sequential([fullyConnectedLayer(hiddenSizes, inputsize),
            sigmoidLayer(),
            fullyConnectedLayer(outputsize, hiddenSizes)])
    else
        layers = Sequential([fullyConnectedLayer(hiddenSizes[1], inputsize), sigmoidLayer()])
        for i = 1:n
            if i == n
                layers.add_module(string(2 * i), fullyConnectedLayer(outputsize, hiddenSizes[i]))
            else
                layers.add_module(string(2 * i), fullyConnectedLayer(hiddenSizes[i+1], hiddenSizes[i]))
                layers.add_module(string(2 * i + 1), sigmoidLayer())
            end
        end
        net = layers
    end
    return net, LossFun
end

function Mse(T, y)
    py"""
   import torch.nn.functional as F
   """
    py"F.mse_loss"(y, T)
end

# function regression(T, y)
#     py"""
#    import torch.nn.functional as F
#    """
#     py"F.mse_loss"(y, T)
# end

function Autoencoder(hiddenSize)
    py"""
    from functionapproximation_python import *
    """
    py"Autoencoder"(hiddenSize)
end

function trainAutoencoder(X, hiddenSize)
    py"""
    from functionapproximation_python import *
    """
    py"trainAutoencoder"(X, hiddenSize)
end

# function trainSoftmaxLayer(hiddenSize)
#     py"""
#     from FunctionApproximation import *
#     """
#     py"trainSoftmaxLayer"(hiddenSize)
# end

function encode(autoenc, Xnew)
    encoder,decoder = predict(autoenc, Xnew)
    return encoder
end

function decode(autoenc, Z)
    decoder = predict(autoenc.decoder, Z)
    return decoder
end

function stack(autoenc1, autoenc2, arg...)
    net = Sequential(autoenc1,autoenc2,arg...)
    return net
end

function patternnet(hiddenSizes, inputsize = 1, outputsize = 1;LossFun = "MSE")
    n = length(hiddenSizes)
    if n == 1
        net = Sequential([fullyConnectedLayer(hiddenSizes, inputsize),
            sigmoidLayer(),
            fullyConnectedLayer(outputsize, hiddenSizes),
            softmaxLayer(1)])
    else
        layers = Sequential([fullyConnectedLayer(hiddenSizes[1], inputsize), sigmoidLayer()])
        for i = 1:n
            if i == n
                layers.add_module(string(2 * i), fullyConnectedLayer(outputsize, hiddenSizes[i]))
                layers.add_module(string(2 * i + 1), softmaxLayerLayer(1))
            else
                layers.add_module(string(2 * i), fullyConnectedLayer(hiddenSizes[i+1], hiddenSizes[i]))
                layers.add_module(string(2 * i + 1), sigmoidLayer())
            end
        end
        net = layers
    end
    return net, LossFun
end

function lvqnet(hiddenSize, inputsize = 1, outputsize = 1; LossFun = "MSE")
    net = Sequential([fullyConnectedLayer(hiddenSize, inputsize, false),
        softmaxLayer(),
        fullyConnectedLayer(outputsize, hiddenSizes, false)])
    return net, LossFun
end

function competlayer(numClasses,inputsize, kohonenLR, conscienceLR)
    net = Sequential([fullyConnectedLayer(numClasses, inputsize),
        softmaxLayer()])
    return net
end



function timedelaynet(inputDelays, hiddenSizes, trainFcn)
    py"""
    from functionapproximation_python import *
    """
    py"TDNN"(X, hiddenSize)
end

function mse(T, y)
    py"""
   from functionapproximation_python import *
   """
    py"mse"(T, y)
end

function ploterrhist(e, bins)
    histogram(e, bins)
end

function plotfit(net, x, t)
    y = predict(net, x)
    e = t .- y
    n = [i for i in range(1, size(t, 1))]
    hold("on")
    plot(n, y, label = "Fit")
    scatter(n, t, s = 10, c = "r", filled = true, label = "Traget")
    scatter(n, y, c = "b", marker = "+", label = "Output")
    hold("off")
    legend()
end
 

function roc(targets, outputs)
    py"""
    from functionapproximation_python import *
    """
    py"roc"(targets, outputs)

end

function plotroc(targets, outputs)
    py"""
    from functionapproximation_python import *
    """
    py"plotroc"(targets, outputs)
end

function onehot(data)
    py"""
    from sklearn.preprocessing import OneHotEncoder
    enc = OneHotEncoder(sparse=False)
    """
    py"enc.fit_transform"(data)
end

function plotconfusion(targets, outputs)
    py"""
    from functionapproximation_python import *
    """
    py"plotconfusion"(targets, outputs)

end

function crossentropy(targets,outputs)
    py"""
    from troch.nn import *
    """
    py"CrossEntropyLoss"(targets,outputs)
end


function simplefit_dataset()
    py"""
    from networklayer_python import *
    """
    py"simplefit_dataset"()
end

function iris_dataset()
    py"""
    from networklayer_python import *
    """
    py"iris_dataset"()
end

function simplecluster_dataset()
    py"""
    from networklayer_python import *
    """
    py"simplecluster_dataset"()
end

function selforgmap(x, y, input_len, sigma = 1.0, learning_rate = 0.5)
    py"""
    from minisom import MiniSom    
    """
    py"MiniSom"(x, y, input_len, sigma = sigma, learning_rate = learning_rate)
end

function plotsomhits(net, inputs)
    py"""
   from functionapproximation_python import *
   """
    py"plotsomhits"(net, inputs)
end

# function plotsomnc(net)
#     py"""
#    from functionapproximation_python import *
#    """
#     py"plotsomnc"(net)
# end

function plotsomnd(net, data)
    py"""
    from functionapproximation_python import *
    """
    py"plotsomnd"(net, data)
end

# function plotsompos(net)
#     py"""
#     from functionapproximation_python import *
#     """
#     py"plotsompoc"(net)
# end

function plotsomtop(net)
    py"""
    from functionapproximation_python import *
    """
    py"plotsomtop"(net)
end

function plotsomplanes(net)
    py"""
   from functionapproximation_python import *
   """
    py"plotsomplanes"(net)
end

