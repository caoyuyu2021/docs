import torch
import torch.nn as nn
from torch.nn import *
import torch.nn.functional as F
import numpy as np
import pandas as pd
from collections import OrderedDict
import cv2
from torchvision import transforms, datasets
from torch.autograd import Variable

def Sequential(layers):
	if not layers:
		return nn.Sequential()
	elif type(layers[0]) == tuple:
		return nn.Sequential(OrderedDict(layers))
	else:
		return nn.Sequential(*layers)

def removeLayers(lgraph, layerName):
	newlgraph = nn.Sequential()
	for item in lgraph._modules.items():
		if item[0] == layerName:
			pass
		else:
			newlgraph.add_module(item[0],item[1])
	return newlgraph
	

def replaceLayer(lgraph, layerName, larray):
	newlgraph = nn.Sequential()
	for item in lgraph._modules.items():
		if item[0] == layerName:
			for i in larray._modules.items():
				newlgraph.add_module(i[0],i[1])
		else:
			newlgraph.add_module(item[0],item[1])
	return newlgraph


class Swish(nn.Module):
	def __init__(self,inplace=True):
		super(Swish,self).__init__()
		self.inplace=inplace
	def forward(self,x):
		if self.inplace:
			x.mul_(torch.sigmoid(x))
			return x
		else:
			return x*torch.sigmoid(x)

class Clipedrule(nn.Module):
	def __init__(self, ceiling):
		super(Clipedrule,self).__init__()
		self.ceiling = ceiling
	def forward(self,x):
		if x < self.ceiling:
			return F.relu(x, inplace=self.inplace)
		else:
			return self.ceiling

# class SequenceInput(nn.Module):
# 	def __init__(self, inputsize):
# 		super(SequenceInput,self).__init__()
# 		self.inputsize = inputsize
# 	def forward(self,x):
# 		x = x.reshape(np.array(self.inputsize))
# 		return x

class SequenceInput(nn.Module):
    def __init__(self, inputsize):
        super(SequenceInput,self).__init__()
        self.inputsize = inputsize
    def forward(self,x):
        x = x.reshape(np.array(self.inputsize))
        x = x.Normalization()
        return x

class featureInputLayer(nn.Module):
    def __init__(self, inputsize):
        super(SequenceInput,self).__init__()
        self.inputsize = inputsize
    def forward(self,x):
        x = x.Normalization()
        return x

class LSTMLayer(nn.Module):
	def __init__(self, inputsize, hidden_size, batch_first = True, bidirectional = False):
		super(LSTMLayer,self).__init__()
		self.hidden_size = hidden_size
		self.inputsize = inputsize
		self.layer = nn.LSTM(inputsize,hidden_size,batch_first = batch_first, bidirectional = bidirectional)
	def forward(self,x):
		x,(h,c) = self.layer(x)
		return x

class crop2dLayer(nn.Module):
    def __init__(self):
        super(crop2dLayer,self).__init__()
        self.size = size
    def forward(self,x,y):
        img = transforms.CenterCrop(self.size)
        return img

class crop3dLayer(nn.Module):
    def __init__(self):
        super(crop3dLayer,self).__init__()
        self.size = size
    def forward(self,x,y):
        img = transforms.CenterCrop(self.size)
        return img

class ADDLayer(nn.Module):
	def __init__(self):
		super(ADDLayer,self).__init__()
	def forward(self,x,y):
		out = x+y
		return out

class MulLayer(nn.Module):
	def __init__(self):
		super(MulLayer,self).__init__()

	def forward(self,x,y):
		out = x*y
		return out

class imageInputLayer(nn.Module):
	def __init__(self, inputsize):
		super(imageInputLayer,self).__init__()
		self.inputsize = inputsize

	def forward(self,x):
		out = datasets.ImageFolder(root = x, transform = transforms.RandomResizedCrop(self.inputsize))
		return out

class image3dInputLayer(nn.Module):
	def __init__(self, inputsize):
		super(image3dInputLayer,self).__init__()
		self.inputsize = inputsize

	def forward(self,x):
		out = datasets.ImageFolder(root = x, transform = transforms.RandomResizedCrop(self.inputsize))
		return out


def japaneseVowelsTrainData():
    train = pd.read_csv("python/datas/JapaneseVowels/train.csv", header=None)
    train = np.array(train)
    Xtrain = []
    for i in range(270):
        Xtrain.append(train[12*i:12*(i+1)])
    Ytrain = pd.read_csv("python/datas/JapaneseVowels/trainlabels.csv", header=None)
    Ytrain = np.array(Ytrain)
    Xtrain = np.array(Xtrain)
    Xtrain = np.transpose(Xtrain,[0,2,1])
    return Xtrain,Ytrain

def japaneseVowelsTestData():
	test = pd.read_csv("python/datas/JapaneseVowels/test.csv", header=None)
	test = np.array(test)
	Xtest = []
	for i in range(370):
		Xtest.append(test[12*i:12*(i+1)])
	Ytest = pd.read_csv("python/datas/JapaneseVowels/testlabels.csv", header=None)
	Ytest = np.array(Ytest)
	Xtest = np.array(Xtest)
	Xtest = np.transpose(Xtest,[0,2,1])
	return Xtest,Ytest

def read_image(directory_name,image_name_list):
    image_list = []
    for imagename in image_name_list:
        img = cv2.imread(directory_name+'/'+imagename)
        image_list.append(img)
    return image_list

def read_grayimage(directory_name,image_name_list):
    image_list = []
    for imagename in image_name_list:
        img = cv2.imread(directory_name+'/'+imagename, cv2.IMREAD_GRAYSCALE)
        image_list.append([img])
    image_list = np.array(image_list)
    return image_list

def DigitDatasetTrainData():
	train = pd.read_csv("python/datas/DigitDataset/digitTrain.csv")
	image_label = train["digit"].to_numpy()
	image_name_list = train["image"].to_numpy()
	image_data = read_grayimage("python/datas/DigitDataset",image_name_list)
	return image_data, image_label

def DigitDatasetTestData():
	train = pd.read_csv("python/datas/DigitDataset/digitTest.csv")
	image_label = train["digit"].to_numpy()
	image_name_list = train["image"].to_numpy()
	image_data = read_grayimage("python/datas/DigitDataset",image_name_list)
	return image_data, image_label

def DigitTrain4DArrayData():
	train = pd.read_csv("python/datas/DigitDataset/digitTrain.csv")
	image_label = train["angle"].to_numpy().reshape(-1,1)
	image_name_list = train["image"].to_numpy()
	image_data = read_grayimage("python/datas/DigitDataset",image_name_list)
	return image_data, image_label

def DigitTest4DArrayData():
	train = pd.read_csv("python/datas/DigitDataset/digitTest.csv")
	image_label = train["angle"].to_numpy().reshape(-1,1)
	image_name_list = train["image"].to_numpy()
	image_data = read_grayimage("python/datas/DigitDataset",image_name_list)
	return image_data, image_label

def simplefit_dataset():
	data = pd.read_csv("python/datas/simplefit_dataset/simplefit_dataset.csv")
	x = data["x"].to_numpy().reshape(-1,1)
	t = data["t"].to_numpy().reshape(-1,1)
	return x,t
	
def iris_dataset():
	data = pd.read_csv("python/datas/iris_dataset/irisInputs.csv", header=None)
	target = pd.read_csv("python/datas/iris_dataset/irisTargets.csv", header=None) 
	x = data.to_numpy()
	t = target.to_numpy()
	return x,t
	
def simplecluster_dataset():
	data = pd.read_csv("python/datas/simplecluster_dataset/simpleclusterinputs.csv", header=None)
	target = pd.read_csv("python/datas/simplecluster_dataset/simpleclusterTargets.csv", header=None) 
	x = data.to_numpy()
	t = target.to_numpy().reshape(-1)
	return x,t

def Tensor(InputData):
	InputData = torch.tensor(InputData)
	return InputData