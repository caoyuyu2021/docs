import pandas as pd
import numpy as np
import cv2
import mindspore
import mindspore.nn as nn
from mindspore.ops import operations
from mindvision import dataset
from mindspore.dataset import vision
from collections import OrderedDict

def SequentialCell(layers):
	if not layers:
		return nn.SequentialCell()
	elif type(layers[0]) == tuple:
		return nn.SequentialCell(OrderedDict(layers))
	else:
		return nn.SequentialCell(layers)
		
class Swish(nn.Cell):
	def __init__(self):
		super(Swish,self).__init__()
		self.Sigmoid = nn.Sigmoid()
	def construct(self,x):
		return x*self.Sigmoid(x)

class AvgPool3d(nn.Cell):
	def __init__(self, kernel_size = 1, stride = 1, pad_mode = "valid", pad = 0, ceil_mode = False, count_include_pad = True, divisor_override=0):
		super(AvgPool3d,self).__init__()
		self.avg_pool = mindspore.ops.AvgPool3D(kernel_size = kernel_size, strides = stride, pad_mode = pad_mode, pad = pad, ceil_mode = ceil_mode, count_include_pad = count_include_pad, divisor_override = divisor_override)
	def construct(self, x):
		return self.avg_pool(x)

class MaxPool3d(nn.Cell):
	def __init__(self, kernel_size = 1, stride = 1, pad_mode = "valid", pad = 0, ceil_mode = None):
		super(MaxPool3d,self).__init__()
		self.max_pool = mindspore.ops.MaxPool3D(kernel_size = kernel_size, strides = stride, pad_mode = pad_mode, pad_list = pad, ceil_mode = ceil_mode)
	def construct(self, x):
		return self.max_pool(x)
		
class AdaptiveMaxPool3d(nn.Cell):
	def __init__(self, output_size):
		super(AdaptiveMaxPool3d,self).__init__()
		self.output_size = output_size
	def construct(self, x):
		return mindspore.ops.adaptive_max_pool3d(x, self.output_size)

class AdaptiveAvgPool3d(nn.Cell):
	def __init__(self, output_size):
		super(AdaptiveMaxPool3d,self).__init__()
		self.output_size = output_size
	def construct(self, x):
		return mindspore.ops.adaptive_avg_pool3d(x, self.output_size)

class LSTM(nn.Cell):
	def __init__(self,input_size, hidden_size, num_layers, has_bias, batch_first, dropout, bidirectional, isclassify = False):
		super(LSTM,self).__init__()
		self.isclassify = isclassify
		self.LSTM = nn.LSTM(input_size=input_size, hidden_size=hidden_size, num_layers=num_layers, has_bias=has_bias, batch_first=batch_first, dropout=dropout, bidirectional=bidirectional)
	def construct(self, x):
		if self.isclassify == False:
			out,_=self.LSTM(x)
		else:
			out,_ = self.LSTM(x)
			out = out[:,-1,:]
		return out

class GRU(nn.Cell):
	def __init__(self,input_size, hidden_size, num_layers, has_bias, batch_first, dropout, bidirectional):
		super(GRU,self).__init__()
		self.GRU = nn.GRU(input_size=input_size, hidden_size=hidden_size, num_layers=num_layers, has_bias=has_bias, batch_first=batch_first, dropout=dropout, bidirectional=bidirectional)
	def construct(self, x):
		out,_=self.GRU(x)
		return out

class DropoutLayer(nn.Cell):
	def __init__(self, probability):
		super(DropoutLayer,self).__init__()
		self.probability = probability
		self.Dropout = nn.Dropout(1-self.probability)
	def construct(self, x):
		out = self.Dropout(x)
		return out
