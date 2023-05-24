function fitnet(hiddenSizes)
    net = feedforwardnet(hiddenSizes)
    return net
end

function feedforwardnet(hiddenSizes, inputsize=1, outputsize=1)
    n = length(hiddenSizes)
    if n == 1
        net = SequentialCell([
            fullyConnectedLayer(inputsize, hiddenSizes),
            sigmoidLayer(),
            fullyConnectedLayer(hiddenSizes, outputsize),
        ])
    else
        layers = SequentialCell([
            fullyConnectedLayer(inputsize, hiddenSizes[1]), sigmoidLayer()
        ])
        for i in 1:n
            if i == n
                layers.insert_child_to_cell(
                    string(2 * i), fullyConnectedLayer(hiddenSizes[i], outputsize)
                )
            else
                layers.insert_child_to_cell(
                    string(2 * i), fullyConnectedLayer(hiddenSizes[i], hiddenSizes[i + 1])
                )
                layers.insert_child_to_cell(string(2 * i + 1), sigmoidLayer())
            end
        end
        net = layers
    end
    return net
end

function train(
    net, train_data, train_label; epochs=100, loss_fun="MSELoss", optimizer="Adam", lr=0.1
)
    options = trainingOptions(loss_fun, optimizer, "MAE", 1, epochs, lr)
    net = trainNetwork(train_data, train_label, net, options)
    return net
end

function plotfit(net, x, t)
    y = TyDeepLearning.predict(net, x)
    e = t .- y
    n = [i for i in range(1, size(t, 1))]
    hold("on")
    plot(n, y; label="Fit")
    scatter(n, t; s=10, c="r", filled=true, label="Traget")
    scatter(n, y; c="b", marker="+", label="Output")
    hold("off")
    return legend()
end

function ploterrhist(e, bins)
    return histogram(e, bins)
end

function roc(targets, outputs)
    py"""
   from ApproControl_M import roc
   """
    py"roc"(targets, outputs)
end

function plotroc(targets, outputs)
    py"""
   from ApproControl_M import plotroc
   """
    fpr, tpr, n_classes = py"plotroc"(targets, outputs)
    return PlotROC(fpr, tpr, n_classes)
end

function regression(targets, outputs)
    py"""
   from ApproControl_M import regression
   """
    py"regression"(targets, outputs)
end

function plotregression(targets, outputs)
    r, m, b = regression(targets, outputs)
    x = [1:10;]
    y = m * x .+ b
    return plot(x, y)
end

function plotperform(TR)
    train = TR["perf"]
    validation = TR["vperf"]
    test = TR["tperf"]
    epoch = TR["epoch"]
    return plot(0:epoch, train, 0:epoch, validation, 0:epoch, test)
end

function plottrainstate(tr)
    gradient = tr["gradient"]
    mu = tr["mu"]
    val_fail = tr["val_fail"]
    figure()
    subplot(3, 1, 1)
    plot(gradient)
    ylabel("gradient")
    subplot(3, 1, 2)
    plot(mu)
    ylabel("mu")
    subplot(3, 1, 3)
    plot(val_fail, "d")
    xlabel("Epochs")
    return ylabel("val_fail"; fontweight="bold")
end

function resetState(net)
    py"""
   from ApproControl_M import resetState
   """
    py"resetState"(net)
end

function patternnet(hiddenSizes, inputsize=1, outputsize=1)
    n = length(hiddenSizes)
    if n == 1
        net = SequentialCell([
            fullyConnectedLayer(inputsize, hiddenSizes),
            sigmoidLayer(),
            fullyConnectedLayer(hiddenSizes, outputsize),
            softmaxLayer(),
        ])
    else
        layers = SequentialCell([
            fullyConnectedLayer(inputsize, hiddenSizes[1]), sigmoidLayer()
        ])
        for i in 1:n
            if i == n
                layers.insert_child_to_cell(
                    string(2 * i), fullyConnectedLayer(hiddenSizes[i], outputsize)
                )
            else
                layers.insert_child_to_cell(
                    string(2 * i), fullyConnectedLayer(hiddenSizes[i], hiddenSizes[i + 1])
                )
                layers.insert_child_to_cell(string(2 * i + 1), softmaxLayer())
            end
        end
        net = layers
    end
    return net
end
