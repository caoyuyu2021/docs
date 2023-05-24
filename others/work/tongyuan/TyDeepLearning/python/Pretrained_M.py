import mindspore as ms
import mindspore_hub as mshub
import ssl
ssl._create_default_https_context = ssl._create_unverified_context

def GoogLeNet (weights):
    """
    Args:
            weights: 'imagenet','cifar10'
    """
    if weights == 'imagenet':
        model = "mindspore/1.9/googlenet_imagenet2012"
        network = mshub.load(model,num_classes=1000)
    elif weights == 'cifar10':
        model = "mindspore/1.9/googlenet_cifar10"
        network = mshub.load(model,num_classes=10)
    return network

def Inceptionv3():
    model = "mindspore/1.9/inceptionv3_imagenet2012"
    network = mshub.load(model,num_classes=1000)
    return network

def MobileNetv2():
    model = "mindspore/1.9/mobilenetv2_imagenet2012"
    network = mshub.load(model,num_classes=1000)
    return network

def ResNet18(weights):
    """
    Args:
            weights: 'imagenet','cifar10'
    """
    if weights == 'imagenet':
        model = "mindspore/1.9/resnet18_imagenet2012"
        network = mshub.load(model, 1001)
    elif weights == 'cifar10':
        model = "mindspore/1.9/resnet18_cifar10"
        network = mshub.load(model,10)
    return network

def ResNet50(weights):
    """
    Args:
            weights: 'imagenet','cifar10'
    """
    if weights == 'imagenet':
        model = "mindspore/1.9/resnet50_imagenet2012"
        network = mshub.load(model,1001)
    elif weights == 'cifar10':
        model = "mindspore/1.9/resnet50_cifar10"
        network = mshub.load(model,10)
    return network

def ResNet101():
    model = "mindspore/1.9/resnet101_imagenet2012"
    network = mshub.load(model,1001)
    return network

def Xception():
    model = "mindspore/1.9/xception_imagenet2012"
    network = mshub.load(model, 1000)
    return network

def ShuffleNet(weights):
    """
    Args:
            weights: 'shufflenetv1','shufflenetv2'
    """
    if weights == 'shufflenetv1':
        model = "mindspore/1.9/shufflenetv1_imagenet2012"
        network = mshub.load(model,1000)
    elif weights == 'shufflenetv2':
        model = "mindspore/1.9/shufflenetv2_imagenet2012"
        network = mshub.load(model,1000)
    return network

def AlexNet(weights):
    """
    Args:
            weights: 'imagenet','cifar10'
    """
    if weights == 'imagenet':
        model = "mindspore/1.9/alexnet_imagenet2012"
        network = mshub.load(model, 1000)
    elif weights == 'cifar10':
        model = "mindspore/1.9/alexnet_cifar10"
        network = mshub.load(model,10)
    return network
