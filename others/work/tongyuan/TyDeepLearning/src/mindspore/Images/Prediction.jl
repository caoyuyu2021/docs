using TyDeepLearning

function predict(net, data)
    py"""
    from Train_M import predict
    """
    py"predict"(net, data)
end

function classify(net, data)
    py"""
    from Train_M import classify
    """
    py"classify"(net, data)
end

function predictAndUpdateState(recNet, data)
    py"""
    from Train_M import predictAndUpdateState
    """
    py"predictAndUpdateState"(recNet, data)
end

function classifyAndUpdateState(recNet, data)
    py"""
    from Train_M import classifyAndUpdateState
    """
    py"classifyAndUpdateState"(recNet, data)
end

function confusionchart(trueLabels, predictedLabels)
    py"""
   from Train_M import confusionchart
   """
    py"confusionchart"(trueLabels, predictedLabels)
end

function sortClasses(cm, order) end

function dataloader(data, label)
    py"""
    from Train_M import dataloader
    """
    py"dataloader"(data, label)
end
