from numpy import Inf
import pandas as pd
import numpy as np
import torch.nn as nn
import torch
import torch.utils.data as Data
import matplotlib.pyplot as plt
from sklearn.preprocessing import MinMaxScaler, StandardScaler
from sklearn.model_selection import train_test_split
import pickle
import networkx as nx
from sklearn.metrics import accuracy_score, confusion_matrix, f1_score, fbeta_score, mean_absolute_error
from sklearn.metrics.pairwise import cosine_similarity
from nltk.translate.bleu_score import sentence_bleu
from scipy.spatial.distance import directed_hausdorff
import os

def trainingoptions(loss, optimizer, metrics, batch_size, epoch, learning_rate, shuffle=False, 
                     verbose=True, plots=False, momentum=0.9, checkpointpath=None, 
                     executionenvironment="auto", eval_data=None, eval_label=None):
    return {"loss":loss, "optimizer":optimizer, "metrics":metrics, "batch_size":batch_size, 
    "epoch":epoch,  "learning_rate":learning_rate, "shuffle":shuffle, "verbose":verbose, 
            "plots":plots, "momentum":momentum, "checkpointpath":checkpointpath, 
            "executionenvironment":executionenvironment, "eval_data":eval_data,
             "eval_label":eval_label}

def trainnetwork(train_data, train_label, layers, options):
    
    loss = options["loss"]
    opt = options["optimizer"]
    metrics = options["metrics"]
    metric = metrics
    batch_size = options["batch_size"]
    epoch = options["epoch"]
    learning_rate = options["learning_rate"]
    shuffle = options["shuffle"]
    verbose = options["verbose"]
    momentum = options["momentum"]
    checkpoint_path = options["checkpointpath"]
    execution_environment = options["executionenvironment"]
    eval_data = options["eval_data"]
    eval_label = options["eval_label"]

    #数据类型转换
    train_data = np.array(train_data)
    train_label = np.array(train_label)

    #训练网络硬件环境选择
    if execution_environment == "auto":
        pass
    elif execution_environment == "GPU":
        device = torch.device("cuda:0")
        # train_data = train_data.cuda()
        # train_label = train_label.cuda()
    elif execution_environment == "CPU":
        device = torch.device("cpu")
        # train_data = train_data.cpu()
        # train_label = train_label.cpu()
    else:
        raise ValueError("Please enter the correct execution environment！")    

    #设置中间参数保存路径
    train_file = os.path.join(os.getcwd(), "train_params.csv")
    eval_file = os.path.join(os.getcwd(), "eval_params.csv")

    #优化器
    Opt = ["Adadelta", "Adagrad", "Adam", "AdaMax", "AdamOffload", "AdamWeightDecay", 
           "ASGD", "LazyAdam", "Momentum", "RMSProp", "Rprop", "SGD"]
    if opt in Opt:
        if opt == "Momentum":
            optimizer = eval('torch.optim.' + opt + '(layers.parameters(), lr=learning_rate, momentum=momentum)')
        else:
            optimizer = eval('torch.optim.' + opt + '(layers.parameters(), lr=learning_rate)')
    else:
        raise ValueError("Please enter the correct optimizer function！") 

    # 目前pytorch无法实现评价指标计算
    def eval_metric(metrics):
        if metrics == 'Accuracy':
            eval_value = accuracy_score(y_true, y_pred)
        elif metrics == 'BleuScore':
            # score = sentence_bleu(reference, candidate)
            eval_value = sentence_bleu(y_true, y_pred)
        elif metrics == 'ConfusionMatrix':
            eval_value = confusion_matrix(y_true, y_pred)
        elif metrics == 'CosineSimilarity':
            eval_value = cosine_similarity(y_true.reshape(1, -1), y_pred.reshape(1, -1))
        elif metrics == 'Dice':
            a_bigrams = set(y_true)
            b_bigrams = set(y_pred)
            overlap = len(a_bigrams & b_bigrams)
            eval_value = overlap * 2.0 / (len(a_bigrams) + len(b_bigrams))
        elif metrics == 'F1':
            eval_value = fbeta_score(y_true, y_pred, average='macro', beta=0.5)
        elif metrics == 'HausdorffDistance':
            eval_value = mean(directed_hausdorff(y_true, y_pred)[0], directed_hausdorff(y_true, y_pred))
        elif metrics == 'MAE':
            eval_value = mean_absolute_error(y_true, y_pred)
        elif metrics == 'MSE':
            sum = 0 
            for i in (y_pred):
                for j in (y_true):
                    sum = sum + euclidean_distances(i, j)
        
    #评价指标 
    Metrics = ["Accuracy", "BleuScore", "ConfusionMatrix", "ConfusionMatrixMetric", "CosineSimilarity",
              "Dice", "F1", "Fbeta", "HausdorffDistance", "Loss", "MAE", "MeanSurfaceDistance",
              "Metric", "MSE", "names", "OcclusionSensitivity", "Perplexity", "Precision", "Recall",
              "ROC", "RootMeanSquareDistance", "Top1CategoricalAccuracy", "Top5CategoricalAccuracy"]
    if metrics in Metrics:
        if metrics == "ConfusionMatrix":
            nums = len(set(train_label))
            metrics = eval("{'"+metrics+"':"+metrics+"(num_classes=nums)}")
        elif metrics == "Fbeta":
            metrics = eval("{'"+metrics+"':"+metrics+"(1)}")
        else:
            metrics = eval("{'"+metrics+"':"+metrics+"()}")
    else:
        raise ValueError("Please enter the correct metrics function！")

    #损失函数
    loss = eval('nn.' + loss + '()')

    #对标签数据进行独热编码
    def one_hot(label):
        loss = options["loss"]
        loss_fn_classification = ["BCELoss","BCEWithLogitsLoss", "CrossEntropyLoss", 
                                "MultiClassDiceLoss","SoftmaxCrossEntropyWithLogits"]
        loss_fn_regression = ["CosineEmbeddingLoss", "DiceLoss", 
                "HuberLoss", "L1Loss", "MSELoss", "NLLLoss", "RMSELoss", "SmoothL1Loss"]
        if loss in loss_fn_classification:
            return pd.get_dummies(label).values
        elif loss in loss_fn_regression:
            return label
        else:
            raise ValueError("Please enter the correct loss function！")  
    
    #生成数据
    def get_data(data, label):
        label = one_hot(label)
        for i in range(len(data)):
            if data.ndim > 1 or label.ndim > 1:
                if data.ndim > 1 and label.ndim == 1:
                    yield np.array(list(data[i])).astype(np.float32), np.array([label[i]]).astype(np.float32)
                elif data.ndim == 1 and label.ndim > 1:
                    yield np.array([data[i]]).astype(np.float32), np.array(list(label[i])).astype(np.float32)
                else:
                    yield np.array(list(data[i])).astype(np.float32), np.array(list(label[i])).astype(np.float32)
            else:
                yield np.array([data[i]]).astype(np.float32), np.array([label[i]]).astype(np.float32)
    
    #数据集操作，划分batch
    def create_dataset(data, label, shuffle, batch_size=batch_size):
        if execution_environment == "auto":
            pass
        elif execution_environment == "GPU":
            data = data.cuda()
            label = label.cuda()
        elif execution_environment == "CPU":
            device = torch.device("cpu")
            data = data.cpu()
            label = label.cpu()
        else:
            raise ValueError("Please enter the correct execution environment！")    
        """生成数据集"""
        dataset = torch.utils.data.TensorDataset(data, label)
        #是否打乱数据
        if shuffle == True:
            data_loader = Data.DataLoader(dataset=dataset, batch_size=5, shuffle=True)
            return data_loader
        else:
            data_loader = Data.DataLoader(dataset=dataset, batch_size=batch_size, shuffle=False)
            return data_loader
    
    #生成训练、验证数据集，对传入数据进行shape变换
    def dataset_reshape(data, label, shuffle, batch_size=batch_size):
        if data.ndim == 2 or label.ndim == 2:
            if data.ndim == 2 and label.ndim != 2:
                if data.shape[1] == 1:
                    data = data.reshape(data.shape[0], )
                    dataset = create_dataset(data, label, shuffle, batch_size=batch_size)
                else:
                    dataset = create_dataset(data, label, shuffle, batch_size=batch_size)
            elif data.ndim != 2 and label.ndim == 2:
                if label.shape[1] == 1:
                    label = label.reshape(label.shape[0], )
                    dataset = create_dataset(data, label, shuffle, batch_size=batch_size)
                else:
                    dataset = create_dataset(data, label, shuffle)
            else:
                if label.shape[1] == 1 or data.shape[1] == 1:
                    if label.shape[1] == 1 and data.shape[1] != 1:
                        label = label.reshape(label.shape[0], )
                        dataset = create_dataset(data, label, shuffle, batch_size=batch_size)
                    elif label.shape[1] != 1 and data.shape[1] == 1:
                        data = data.reshape(data.shape[0], )
                        dataset = create_dataset(data, label, shuffle, batch_size=batch_size)
                    else:
                        label = label.reshape(label.shape[0], )
                        data = data.reshape(data.shape[0], )
                        dataset = create_dataset(data, label, shuffle, batch_size=batch_size)
                else:
                    dataset = create_dataset(data, label, shuffle, batch_size=batch_size)
        else:
            dataset = create_dataset(data, label, shuffle, batch_size=batch_size)
        return dataset
    train_dataset = dataset_reshape(train_data, train_label, shuffle, batch_size=batch_size)  
    
    #使用Model构建训练网络
    model = layers
    model.to(device)

    #每次训练前判断中间参数是否存在
    if os.path.exists(train_file) == True:
        os.remove(train_file)
    if os.path.exists(eval_file) == True:
        os.remove(eval_file)

    # Pytorch中没有保存步这一参数
    # def save__train_param():
    # # 保存epoch，损失和（验证集）准确率
    #     state = {'model':model.state_dict(), 'epoch':iteration,'loss': my_loss}
    #     torch.save(state, "param.pth")
    #     checkpoint = torch.load('param.pth')
    #     net=checkpoint['model']
    #     loss=checkpoint['loss']
    #     epoch = checkpoint['epoch']
    #     loss = loss.detach().numpy()
    #     epoch = np.int64(epoch)   

    #     train_dataframe = pd.DataFrame({'epoch_num':[epoch_num], 'loss':[loss]})
    #     train_dataframe.to_csv('train_file', index=False, mode='a', sep=',', header=False)
     
    #定义新类重写Callback类中on_train_step_end方法，保存训练过程中的评估值
    class Save_eval_param(mindspore.Callback):
        def __init__(self, eval_model, ds_eval, metric):
            super(Save_eval_param, self).__init__()
            self.model = eval_model
            self.ds_eval = ds_eval
            self.metric = metric

        def on_train_step_end(self, run_context):
            cb_params = run_context.original_args()
            step_num = cb_params.cur_step_num
            result = self.model.eval(self.ds_eval, dataset_sink_mode=False)
            eval_dataframe = pd.DataFrame({'step_num':[step_num], 'validation_eval':[result[self.metric]]})
            eval_dataframe.to_csv(eval_file, index=False, mode='a', sep=',', header=False)

    # 定义保存ckpt文件的回调接口
    class SaveCkptMonitor(mindspore.Callback):
        """定义初始化过程"""
        def __init__(self, checkpoint_path):
            super(SaveCkptMonitor, self).__init__()
            self.checkpoint_path = checkpoint_path  # 定义模型路径

        def on_train_end(self, run_context):
            """定义step结束时的执行操作"""
            cb_params = run_context.original_args()
            if self.checkpoint_path == None:
                os.remove(train_file)
                os.remove(eval_file)
                raise ValueError("Please enter the correct model path！")
            else:
                if '.ckpt' in checkpoint_path:
                    file_name = checkpoint_path
                    # 保存网络模型
                    mindspore.save_checkpoint(save_obj=cb_params.train_network, ckpt_file_name=file_name)
                else:
                    os.remove(train_file)
                    os.remove(eval_file)
                    raise ValueError("Currently only the .ckpt format is supported！")
    #调用SaveCkptMonitor类
    save_ckpt_monitor = SaveCkptMonitor(checkpoint_path)

    #是否保存模型
    if checkpoint_path is not None:
        #训练数据，是否使用验证集
        if eval_data is not None and eval_label is not None:
            eval_data = np.array(eval_data)
            eval_label = np.array(eval_label)
            eval_dataset = dataset_reshape(eval_data, eval_label, shuffle, batch_size=batch_size)
            #调用Save_eval_param类
            save_eval_param = Save_eval_param(model, eval_dataset, metric)
            #是否打印训练过程
            if verbose == True:
                print(model.train(epoch=epoch, train_dataset=train_dataset, callbacks=[LossMonitor(learning_rate), save_ckpt_monitor, save_train_param, 
                                                                                    save_eval_param]), model.eval(eval_dataset))
            else:
                model.train(epoch=epoch, train_dataset=train_dataset, callbacks=[save_ckpt_monitor, save_train_param, save_eval_param])
                model.eval(eval_dataset)
        else:
            #是否打印训练过程
            if verbose == True:
                print(model.train(epoch=epoch, train_dataset=train_dataset, callbacks=[LossMonitor(learning_rate), save_ckpt_monitor, save_train_param]))
            else:
                model.train(epoch=epoch, train_dataset=train_dataset, callbacks=[save_train_param, save_ckpt_monitor])
    else:
        #训练数据，是否使用验证集
        if eval_data is not None and eval_label is not None:
            eval_data = np.array(eval_data)
            eval_label = np.array(eval_label)
            eval_dataset = dataset_reshape(eval_data, eval_label, shuffle, batch_size=batch_size)
            #调用Save_eval_param类
            save_eval_param = Save_eval_param(model, eval_dataset, metric)
            #是否打印训练过程
            if verbose == True:
                print(model.train(epoch=epoch, train_dataset=train_dataset, callbacks=[LossMonitor(learning_rate), save_train_param, 
                                                                                    save_eval_param]), model.eval(eval_dataset))
            else:
                model.train(epoch=epoch, train_dataset=train_dataset, callbacks=[save_train_param, save_eval_param])
                model.eval(eval_dataset)
        else:
            #是否打印训练过程
            if verbose == True:
                print(model.train(epoch=epoch, train_dataset=train_dataset, callbacks=[LossMonitor(learning_rate), save_train_param]))
            else:
                model.train(epoch=epoch, train_dataset=train_dataset, callbacks=[save_train_param])

    return model

def predict(net, data):
    if net._modules:
        for item in net._modules.items():
            break
        if item[0] == "encoder":
            with torch.no_grad():
                data = torch.tensor(data,dtype = torch.float32)
                return net(data)[1].detach().numpy()
        else:
            with torch.no_grad():
                data = torch.tensor(data,dtype = torch.float32)
                return net(data).detach().numpy()
    else:
        with torch.no_grad():
                data = torch.tensor(data,dtype = torch.float32)
                return net(data).detach().numpy()

def classify(net, data):
    with torch.no_grad():
        data = torch.tensor(data,dtype = torch.float32)
        pre_data = net(data).detach().numpy()
    return pre_data

def predictAndUpdateState(net, data):
    Xtrain = data[0]
    Ytrain = data[1]
    optimizer = torch.optim.Adam(net.parameters(), lr=0.001)
    net.train()
    Xtrain = torch.tensor(Xtrain,dtype = torch.float32)
    Ytrain = torch.tensor(Ytrain,dtype = torch.float32)
    out = net(Xtrain)
    loss_func = nn.MSELoss()
    loss = loss_func(out, Ytrain)
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()   
    return net,net(Xtrain).detach().numpy()

def classifyAndUpdateState(net, data): 
    Xtrain = data[0]
    Ytrain = data[1]
    optimizer = torch.optim.Adam(net.parameters(), lr=0.001)
    net.train()
    Xtrain = torch.tensor(Xtrain,dtype = torch.float32)
    Ytrain = torch.tensor(Ytrain).reshape(-1)
    out = net(Xtrain)
    loss_func = nn.CrossEntropyLoss()
    loss = loss_func(out, Ytrain)
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()   
    return net,net(Xtrain).detach().numpy()

def savemodel(net, file):
    return torch.save(net.state_dict(), file)

def loadmodel(net, file):
    net = net.load_state_dict(torch.load(file))
    return net

#保存模型
def saveir(net, inputs, file):
    torch.save(net, file)

# pytorch无法完成绘制混淆矩阵
# def confusionchart(trueLabels, predictedLabels):
#     targets = trueLabels.flatten()
#     classes_list = targets.tolist()
#     classes_set = set(classes_list)
#     n_classes = len(classes_set)
#     metric = nn.ConfusionMatrix(num_classes=n_classes, normalize='no_norm', threshold=0.5)
#     metric.clear()
#     metric.update(trueLabels, predictedLabels)
#     output = metric.eval()
#     return output
