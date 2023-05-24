import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.utils.data as Data
import numpy as np
import pandas as pd
from sklearn.metrics import roc_curve, confusion_matrix
from matplotlib import cm
import matplotlib.pyplot as plt
from matplotlib.patches import RegularPolygon

class AutoEncoder(nn.Module):
    def __init__(self, hiddensize):
        super(AutoEncoder,self).__init__()
        self.encoder  =  nn.Sequential(
            nn.Linear(hiddensize,128),
            nn.Tanh(),
            nn.Linear(128, 64),
            nn.Tanh(),
            nn.Linear(64, 32),
            nn.Tanh(),
            nn.Linear(32, 16),
            nn.Tanh(),
            nn.Linear(16, 3)
        )
        self.decoder = nn.Sequential(
            nn.Linear(3,16),
            nn.Tanh(),
            nn.Linear(16, 32),
            nn.Tanh(),
            nn.Linear(32, 64),
            nn.Tanh(),
            nn.Linear(64, 128),
            nn.Tanh(),
            nn.Linear(128, hiddensize),

        )
    def forward(self, x):
        encoded = self.encoder(x)
        decoded = self.decoder(encoded)
        return encoded,decoded


def trainAutoencoder(X, hiddensize):
    net = AutoEncoder(hiddensize)
    traindata = torch.tensor(X, dtype=torch.float32)
    batch_size = traindata.shape[0]
    dataset = Data.TensorDataset(traindata)
    dataloader = Data.DataLoader(dataset, batch_size=batch_size)
    loss_func = nn.MSELoss()
    epochs = 5000
    minloss = float('inf')
    last_improvement = 0
    lr = 0.01
    optimizer = torch.optim.SGD(net.parameters(), lr=lr)
    scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(optimizer, mode='min', factor=0.1, patience=50, verbose=True, threshold=0.0001, threshold_mode='rel', cooldown=0, min_lr=0, eps=1e-8)
    for epoch in range(epochs):    
        net.train()
        running_loss = 0.0
        for step, batch_data in enumerate(dataloader):
            Xtrain = batch_data[0]
            encoded, decoded = net(Xtrain)
            loss = loss_func(decoded, Xtrain)
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()
            running_loss += loss.item()
        scheduler.step(running_loss) 
        step += 1
        print("\rEpoch: {:d}/{:d} train_loss: {:.4f} ".format(epoch + 1, epochs, running_loss / step))
        if minloss > running_loss:
            last_improvement = epoch
            minloss = running_loss
            
        if epoch - last_improvement >=100:
            break

        
    return net



class TDNN(nn.Module):

    def __init__(
        self,
        input_dim=23,
        output_dim=512,
        context_size=5,
        stride=1,
        dilation=1,
        batch_norm=True,
        dropout_p=0.0,
        padding=0
    ):
        super(TDNN, self).__init__()
        self.context_size = context_size
        self.stride = stride
        self.input_dim = input_dim
        self.output_dim = output_dim
        self.dilation = dilation
        self.dropout_p = dropout_p
        self.padding = padding

        self.kernel = nn.Conv1d(self.input_dim,
                                self.output_dim,
                                self.context_size,
                                stride=self.stride,
                                padding=self.padding,
                                dilation=self.dilation)

        self.nonlinearity = nn.ReLU()
        self.batch_norm = batch_norm
        if batch_norm:
            self.bn = nn.BatchNorm1d(output_dim)
        self.drop = nn.Dropout(p=self.dropout_p)

    def forward(self, x):
        '''
        input: size (batch, seq_len, input_features)
        outpu: size (batch, new_seq_len, output_features)
        '''

        _, _, d = x.shape
        assert (d == self.input_dim), 'Input dimension was wrong. Expected ({}), got ({})'.format(
            self.input_dim, d)

        x = self.kernel(x.transpose(1, 2))
        x = self.nonlinearity(x)
        x = self.drop(x)

        if self.batch_norm:
            x = self.bn(x)
        return x.transpose(1, 2)

def mse(T,y):
    T = torch.tensor(T, dtype=torch.float32)
    y = torch.tensor(y, dtype=torch.float32)
    loss_func = nn.MSELoss()
    loss = loss_func(y, T).numpy().tolist ()
    return loss


def roc(targets, outputs):
    n_classes = targets.shape[1]
    fpr = dict()
    tpr = dict()
    thresholds = dict()
    for i in range(n_classes):
        fpr[i], tpr[i], thresholds[i] = roc_curve(targets[:, i], outputs[:, i])
    return fpr,tpr,thresholds

def plotroc(targets, outputs):
    fpr,tpr,thresholds = roc(targets, outputs)
    n_classes = targets.shape[1]
    for i in range(n_classes):
        plt.plot(fpr[i], tpr[i] , lw=2,
                label='ROC curve of class {0}'
                ''.format(i))

    plt.plot([0, 1], [0, 1], 'k--', lw=2)
    plt.xlim([0.0, 1.0])
    plt.ylim([0.0, 1.05])
    plt.xlabel('False Positive Rate')
    plt.ylabel('True Positive Rate')
    plt.title('Some extension of Receiver operating characteristic to multi-class')
    plt.legend(loc="lower right")
    plt.show()

def plotconfusion(targets, outputs):
    C = confusion_matrix(targets, outputs)
    plt.matshow(C, cmap=plt.cm.Reds)
    for i in range(len(C)):
        for j in range(len(C)):
            plt.annotate(C[j, i], xy=(i, j), horizontalalignment='center', verticalalignment='center')
    plt.ylabel('True label')
    plt.xlabel('Predicted label')
    plt.show()

def plotsomplanes(net):
    W = net.get_weights()
    xsize = W.shape[0]
    ysize = W.shape[1]
    classesnum = W.shape[2]
    plt.figure(figsize=(10, 10))
    for i in np.arange(classesnum):
        plt.subplot(3, 3, i+1)
        plt.pcolor(W[:,:,i].T, cmap='coolwarm')
        plt.xticks(np.arange(xsize+1))
        plt.yticks(np.arange(ysize+1))
    plt.tight_layout()
    plt.show()


def plotsomtop(net):
    umatrix = net.distance_map()
    weights = net.get_weights()
    f = plt.figure(figsize=(10,10))
    ax = f.add_subplot(111)
    ax.set_aspect('equal')
    for i in range(weights.shape[0]):
        for j in range(weights.shape[1]):
            wy = yy[(i, j)] * np.sqrt(3) / 2
            hex = RegularPolygon((xx[(i, j)], wy),
                                numVertices=6,
                                radius=.95 / np.sqrt(3),
                                # facecolor=cm.Blues(umatrix[i, j]),
                                alpha=.4,
                                edgecolor='gray')
            ax.add_patch(hex)
    for cnt, x in enumerate(data):
        # getting the winner
        w = som.winner(x)
        # place a marker on the winning position for the sample xx
        wx, wy = som.convert_map_to_euclidean(w)
        wy = wy * np.sqrt(3) / 2
        plt.plot(wx, wy,
                markersize=12,
                markeredgewidth=2)
    xrange = np.arange(weights.shape[0])
    yrange = np.arange(weights.shape[1])
    plt.xticks(xrange-.5, xrange)
    plt.yticks(yrange * np.sqrt(3) / 2, yrange)
    plt.show()

def plotsomnd(net, data):
    xx, yy = net.get_euclidean_coordinates()
    umatrix = net.distance_map()
    weights = net.get_weights()
    f = plt.figure(figsize=(10,10))
    ax = f.add_subplot(111)
    ax.set_aspect('equal')
    for i in range(weights.shape[0]):
        for j in range(weights.shape[1]):
            wy = yy[(i, j)] * np.sqrt(3) / 2
            hex = RegularPolygon((xx[(i, j)], wy),
                                numVertices=6,
                                radius=.95 / np.sqrt(3),
                                facecolor=cm.Blues(umatrix[i, j]),
                                alpha=.4,
                                edgecolor='gray')
            ax.add_patch(hex)
    for cnt, x in enumerate(data):
        # getting the winner
        w = net.winner(x)
        # place a marker on the winning position for the sample xx
        wx, wy = net.convert_map_to_euclidean(w)
        wy = wy * np.sqrt(3) / 2
        plt.plot(wx, wy,
                markersize=12,
                markeredgewidth=2)
    xrange = np.arange(weights.shape[0])
    yrange = np.arange(weights.shape[1])
    plt.xticks(xrange-.5, xrange)
    plt.yticks(yrange * np.sqrt(3) / 2, yrange)
    plt.show()


def plotsomhits(net, inputs):
    som = net
    data = inputs
    w_x, w_y = zip(*[som.winner(d) for d in data])
    w_x = np.array(w_x)
    w_y = np.array(w_y)


    plt.figure(figsize=(10, 9))
    plt.pcolor(som.distance_map().T, cmap='bone_r', alpha=.2)
    plt.colorbar()
    for i in range(len(w_x)):
        plt.scatter(w_x[i]+.5+(np.random.rand(1)-.5)*.8,w_y[i]+.5+(np.random.rand(1)-.5)*.8,c='b',s=50)

    # for c in np.unique(target):
    #     idx_target = target==c
    #     print(idx_target)
    #     plt.scatter(w_x[idx_target]+.5+(np.random.rand(np.sum(idx_target))-.5)*.8,
    #                 w_y[idx_target]+.5+(np.random.rand(np.sum(idx_target))-.5)*.8,
    #                 s=50)
    plt.grid()
    plt.show()