import torch
import torch.nn as nn
from torchvision import transforms, datasets
import torchvision.models as models
from PIL import Image
import pretrainnetworks_python as prenet
#filename="./datas/classification.jpg"
#input_image = Image.open(filename)

def googlenet(pretrained=True):
    model = models.googlenet(pretrained = pretrained)
    model.eval()
    if torch.cuda.is_available():
        model.to('cuda')
    return model

def inceptionV3(pretrained=True):
    model = models.inception.inception_v3(pretrained = pretrained)
    model.eval()
    if torch.cuda.is_available():
        model.to('cuda')
    return model

def mobilenetv2(pretrained=True):
    model = models.mobilenet_v2(pretrained = pretrained)
    model.eval()
    if torch.cuda.is_available():
        model.to('cuda')
    return model

def resnet18(pretrained=True):
    model = models.resnet18(pretrained = pretrained)
    model.eval()
    if torch.cuda.is_available():
        model.to('cuda')
    return model

def resnet50(pretrained=True):
    model = models.resnet50(pretrained = pretrained)
    model.eval()
    if torch.cuda.is_available():
        model.to('cuda')
    return model

def resnet101(pretrained=True):
    model = models.resnet101(pretrained = pretrained)
    model.eval()
    if torch.cuda.is_available():
        model.to('cuda')
    return model

def shufflenet(pretrained=True):
    model = models.shufflenet_v2_x0_5(pretrained = pretrained)
    model.eval()
    if torch.cuda.is_available():
        model.to('cuda')
    return model

def alexnet(pretrained=True):
    model = models.alexnet(pretrained = pretrained)
    model.eval()
    if torch.cuda.is_available():
        model.to('cuda')
    return model

def xception(pretrained=True):
    model = prenet.xception(pretrained = pretrained)
    model.eval()
    if torch.cuda.is_available():
        model.to('cuda')
    return model





