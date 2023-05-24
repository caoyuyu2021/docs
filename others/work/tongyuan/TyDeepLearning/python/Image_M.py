import mindspore.dataset.vision as vision
import mindspore.dataset as ds
from mindspore.dataset.transforms import Compose
import numpy as np

def imageDataAugmenter(Pad = [], CenterCrop = [], Crop = [], FiveCrop = [], RandomCrop = [],Resize = [], HorizontalFlip = False, RandomHorizontalFlip = [], VerticalFlip = False, RandomVerticalFlip = [], Rescale = [], Rotate = [], RandomRotation = [], Normalize = [], HWC2CHW = False):
    Augmenter = []
    if Pad != []:
        if isinstance(Pad, int):
            Augmenter.append(vision.Pad(Pad))
        elif len(Pad) == 2:
            Augmenter.append(vision.Pad((Pad[0], Pad[1])))
        elif len(Pad)== 4:
            Augmenter.append(vision.Pad((Pad[0], Pad[1],Pad[2], Pad[3])))
    if CenterCrop != []:
        if isinstance(CenterCrop, int):
            Augmenter.append(vision.CenterCrop(CenterCrop))
        else:
            Augmenter.append(vision.CenterCrop((CertenCrop[0], CertenCrop[1])))
    if Crop != []:
        Augmenter.append(vision.Crop((Crop[0],Crop[1])))
    if FiveCrop != []:
        if isinstance(FiveCrop, int):
            Augmenter.append(vision.FiveCrop(FiveCrop))
        else:
            Augmenter.append(vision.FiveCrop((FiveCrop[0], FiveCrop[1])))
    if RandomCrop != []:
        if isinstance(RandomCrop, int):
            Augmenter.append(vision.RandomCrop(RandomCrop))
        else:
            Augmenter.append(vision.RandomCrop((RandomCrop[0], RandomCrop[1])))
    if Resize != []:
        if isinstance(Resize, int):
            Augmenter.append(vision.Resize(Resize))
        else:
            Augmenter.append(vision.Resize((Resize[0], Resize[1])))
    if HorizontalFlip:
        Augmenter.append(vision.HorizontalFlip())
    if RandomHorizontalFlip != []:
        Augmenter.append(vision.RandomHorizontalFlip(RandomHorizontalFlip))
    if VerticalFlip:
        Augmenter.append(vision.VerticalFlip())
    if RandomVerticalFlip!= []:
        Augmenter.append(vision.RandomVerticalFlip(RandomVerticalFlip)) 
    if Rescale != []:
        Augmenter.append(vision.Rescale(Rescale,0))
    if Rotate != []:
        Augmenter.append(vision.Rotate(Rotate))
    if RandomRotation != []:
        if isinstance(RandomRotation, (int, float)):
            Augmenter.append(vision.RandomRotation(RandomRotation))
        else:
            Augmenter.append(vision.RandomRotation((RandomRotation[0], RandomRotation[1])))
    if Normalize != []:
        Augmenter.append(vision.Normalize(Normalize[0],Normalize[1], False))
    if HWC2CHW:
        Augmenter.append(vision.HWC2CHW)
    return Augmenter
    
def augment(Augmenter, I):
    transformed_list = Compose(Augmenter)
    dataset = ds.NumpySlicesDataset(I, shuffle=False)
    dataset = dataset.map(operations=transformed_list)
    data = np.array([data[0].asnumpy() for data in dataset])
    return data

def augmentedImageDatastore(outputsize, X, Y, Augmenter, OutputSizeMode = "centercrop"):
    if OutputSizeMode == "centercrop":
        transforms_list = [vision.CenterCrop(outputsize)]
        X =  ds.NumpySlicesDataset(X, shuffle=False)
        X = X.map(operations=transforms_list)
    transformed_list = Compose(Augmenter)
    dataset = X.map(operations=transformed_list)
    data = np.array([data[0].asnumpy() for data in dataset])
    return data
    
    


    


    




    
    
    
    
    
    



