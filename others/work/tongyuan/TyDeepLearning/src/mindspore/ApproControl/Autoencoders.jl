function trainSoftmaxLayer(x, t)
    py"""
    from AutoEncoder_M import trainSoftmaxLayer
    from Train_M import trainingoptions, trainnetwork
    """
    py"trainSoftmaxLayer"(x, t)
end

function trainAutoencoder(x, hiddensize)
    py"""
    from AutoEncoder_M import trainAutoencoder
    from Train_M import trainingoptions, trainnetwork
    """
    py"trainAutoencoder"(x, hiddensize)
end

function encode(autoenc, Xnew)
    py"""
    from AutoEncoder_M import encode
    from Train_M import trainingoptions, trainnetwork
    """
    py"encode"(autoenc, Xnew)
end

function decode(autoenc, Z)
    py"""
    from AutoEncoder_M import decode
    from Train_M import trainingoptions, trainnetwork
    """
    py"decode"(autoenc, Z)
end
