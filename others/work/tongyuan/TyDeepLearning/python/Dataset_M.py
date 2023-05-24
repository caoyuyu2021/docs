import pandas as pd
import numpy as np
import cv2
import mindspore
import mindspore.nn as nn
from mindspore.ops import operations
from mindvision import dataset
from mindspore.dataset import vision

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

def DigitDatasetTrainData(file):
	train = pd.read_csv(file + "/digitTrain.csv")
	image_label = train["digit"].to_numpy()
	image_name_list = train["image"].to_numpy()
	image_data = read_grayimage(file,image_name_list)
	return image_data, image_label

def DigitDatasetTestData(file):
	train = pd.read_csv(file + "/digitTest.csv")
	image_label = train["digit"].to_numpy()
	image_name_list = train["image"].to_numpy()
	image_data = read_grayimage(file,image_name_list)
	return image_data, image_label

def DigitDataset():
	training_data = dataset.Mnist(
	path="dataset",
	split="train",
	download=True)
# Download test data from open datasets
	test_data = dataset.Mnist(
		path="dataset",
		split="test",
		download=True
	)
	train_dataset = training_data.dataset
	test_dataset = test_data.dataset
	transforms = [
		vision.Rescale(1.0 / 255.0, 0),
		vision.Normalize(mean=(0.1307,), std=(0.3081,)),
		vision.HWC2CHW()
	]
	train_dataset = train_dataset.map(transforms, 'image').batch(64)
	test_dataset = test_dataset.map(transforms, 'image').batch(64)
	return train_dataset, test_dataset

def DigitTrain4DArrayData(file):
	train = pd.read_csv(file + "/digitTrain.csv")
	image_label = train["angle"].to_numpy().reshape(-1,1)
	image_name_list = train["image"].to_numpy()
	image_data = read_grayimage(file ,image_name_list)
	return image_data, image_label

def DigitTest4DArrayData(file):
	train = pd.read_csv(file + "/digitTest.csv")
	image_label = train["angle"].to_numpy().reshape(-1,1)
	image_name_list = train["image"].to_numpy()
	image_data = read_grayimage(file,image_name_list)
	return image_data, image_label

def simplefit_dataset(file):
	data = pd.read_csv(file + "/simplefit_dataset.csv")
	x = data["x"].to_numpy().reshape(-1,1)
	t = data["t"].to_numpy().reshape(-1,1)
	return x,t

