import mindspore
from scipy import stats 
import numpy as np 
import mindspore.nn as nn
import matplotlib.pyplot as plt

def roc(targets, outputs):
    targets = targets.flatten()
    classes_list = targets.tolist()
    classes_set = set(classes_list)
    n_classes = len(classes_set)
    targets = mindspore.Tensor(targets)
    outputs = mindspore.Tensor(outputs)
    metric = nn.ROC(class_num = n_classes)
    metric.clear()
    metric.update(outputs, targets)
    fpr, tpr, thresholds = metric.eval()
    return fpr,tpr,thresholds

def plotroc(targets, outputs):
    fpr,tpr,thresholds = roc(targets, outputs)
    n_classes = outputs.shape[1]
    return fpr, tpr, n_classes

def regression(t, y):
    slope, intercept, r_value, p_value, std_err = stats.linregress(y, t)
    return r_value, slope, intercept


def resetState(net):
    net = net._network
    net_list = []
    for item in net.cells_and_names():
        if item[0]:
            net_list.append(item[1])
    net = nn.SequentialCell(net_list)
    net.init_parameters_data
    return net
    