import pandas as pd
import mindspore as ms
import mindspore.nn as nn
from mindspore import ops
import matplotlib.pyplot as plt
from mindspore.dataset import GeneratorDataset
import numpy as np
from mindspore.dataset import MnistDataset, GeneratorDataset
from mindspore import Tensor
import mindspore
from mindspore import export
from mindspore import nn, ops
from mindspore import dtype as mstype
from mindspore.dataset import transforms
from mindvision.engine.callback import LossMonitor
import os
import re
import platform
from mindvision.engine.callback import ValAccMonitor
import mindspore.dataset as ds
from mindspore.nn import BCELoss,BCEWithLogitsLoss, CosineEmbeddingLoss, CrossEntropyLoss, DiceLoss, HuberLoss, L1Loss, MSELoss, MultiClassDiceLoss, NLLLoss, RMSELoss, SmoothL1Loss, SoftmaxCrossEntropyWithLogits
from mindspore.nn import Adadelta, Adagrad, Adam, AdaMax, AdamOffload, AdamWeightDecay, ASGD, LazyAdam, Momentum, RMSProp, Rprop, SGD
from mindspore.nn import Accuracy, BleuScore, ConfusionMatrix, ConfusionMatrixMetric, CosineSimilarity,Dice, F1, Fbeta, HausdorffDistance, Loss, MAE, MeanSurfaceDistance,Metric, MSE, names, OcclusionSensitivity, Perplexity, Precision, Recall,ROC, RootMeanSquareDistance, Top1CategoricalAccuracy, Top5CategoricalAccuracy

def predict(net, data):
    data = ms.Tensor(data, ms.float32)
    if (type(net) == mindspore.train.model.Model):
        output = net.predict(data)
    else:
        output = net(data)
    if (type(output) == tuple):
        return output[0].asnumpy()
    else:
        return output.asnumpy()

def classify(net, data):
    data = ms.Tensor(data, ms.float32)
    if (type(net) == mindspore.train.model.Model):
        output = net.predict(data)
    else:
        output = net(data)
    return output.asnumpy()

def predictAndUpdateState(net, data):
    data = ms.Tensor(data, ms.float32)
    if (type(net) == mindspore.train.model.Model):
        output = net.predict(data)
    else:
        output = net(data)
    return net, output.asnumpy()

def classifyAndUpdateState(net, data):
    data = ms.Tensor(data, ms.float32)
    if (type(net) == mindspore.train.model.Model):
        output = net.predict(data)
    else:
        output = net(data)
    return net, output.asnumpy()

def confusionchart(trueLabels, predictedLabels):
    targets = trueLabels.flatten()
    classes_list = targets.tolist()
    classes_set = set(classes_list)
    n_classes = len(classes_set)
    metric = nn.ConfusionMatrix(num_classes=n_classes, normalize='no_norm', threshold=0.5)
    metric.clear()
    metric.update(trueLabels, predictedLabels)
    output = metric.eval()
    return output

def trainingoptions(loss, optimizer, metrics, batch_size, epoch, learning_rate, shuffle=False, 
                     verbose=True, plots=False, momentum=0.9, checkpointpath=None, executionenvironment="auto", eval_data=None, eval_label=None):
    """
    训练深度学习神经网络的选项

    Args:
        loss (损失函数): {BCELoss: 计算目标值和预测值之间的二值交叉熵损失值。
                          BCEWithLogitsLoss: 输入经过sigmoid激活函数后作为预测值，BCEWithLogitsLoss 计算预测值和目标值之间的二值交叉熵损失。
                          CosineEmbeddingLoss: 余弦相似度损失函数，用于测量两个Tensor之间的相似性。
                          CrossEntropyLoss: 计算预测值和目标值之间的交叉熵损失。
                          DiceLoss: Dice系数是一个集合相似性loss，用于计算两个样本之间的相似性。
                          HuberLoss: HuberLoss计算预测值和目标值之间的误差。
                          L1Loss: L1Loss用于计算预测值和目标值之间的平均绝对误差。
                          MSELoss: 用于计算预测值与标签值之间的均方误差。
                          MultiClassDiceLoss: 对于多标签问题，可以将标签通过one-hot编码转换为多个二分类标签。
                          NLLLoss: 计算预测值和目标值之间的负对数似然损失。
                          RMSELoss: RMSELoss用来测量 x 和 y 元素之间的均方根误差，其中 x 是输入Tensor， y 是目标值。
                          SmoothL1Loss: SmoothL1损失函数，如果预测值和目标值的逐个元素绝对误差小于设定阈值 beta 则用平方项，否则用绝对误差项。
                          SoftmaxCrossEntropyWithLogits: 计算预测值与真实值之间的交叉熵。}
        opt (优化器): {Adadelta: Adadelta算法的实现。
                       Adagrad: Adagrad算法的实现。
                       Adam: Adaptive Moment Estimation (Adam)算法的实现。
                       AdaMax: AdaMax算法是基于无穷范数的Adam的一种变体。
                       AdamOffload: 此优化器在主机CPU上运行Adam优化算法，设备上仅执行网络参数的更新，最大限度地降低内存成本。
                       AdamWeightDecay: 权重衰减Adam算法的实现。
                       ASGD: 实现平均随机梯度下降。
                       LazyAdam: Adaptive Moment Estimation (Adam)算法的实现。
                       Momentum: Momentum算法的实现。
                       RMSProp: 均方根传播（RMSProp）算法的实现。
                       Rprop: 实现弹性反向传播。
                       SGD: 随机梯度下降的实现。}
        metrics (评价指标): {Accuracy: 计算数据分类的正确率，包括二分类和多分类。
                             BleuScore: 计算BLEU分数。
                             ConfusionMatrix: 计算混淆矩阵(confusion matrix)，通常用于评估分类模型的性能，包括二分类和多分类场景。
                             ConfusionMatrixMetric: 计算与混淆矩阵相关的度量。
                             CosineSimilarity: 计算余弦相似度。
                             Dice: 集合相似性度量。
                             F1: 计算F1 score。
                             Fbeta: 计算Fbeta评分。
                             HausdorffDistance: 计算Hausdorff距离。
                             Loss: 计算loss的平均值。
                             MAE: 计算平均绝对误差MAE（Mean Absolute Error）。
                             MeanSurfaceDistance: 计算从 y_pred 到 y 的平均表面距离。
                             Metric: 用于计算评估指标的基类。
                             MSE: 测量均方差MSE（Mean Squared Error）。
                             names: 获取所有metric的名称。
                             OcclusionSensitivity: 用于计算神经网络对给定图像的遮挡灵敏度（Occlusion Sensitivity），表示了图像的哪些部分对神经网络的分类决策最重要。
                             Perplexity: 计算困惑度（perplexity）。
                             Precision: 计算数据分类的精度，包括单标签场景和多标签场景。
                             Recall: 计算数据分类的召回率，包括单标签场景和多标签场景。
                             ROC: 计算ROC曲线。
                             RootMeanSquareDistance: 计算从 y_pred 到 y 的均方根表面距离。
                             Top1CategoricalAccuracy: 计算top-1分类正确率。
                             Top5CategoricalAccuracy: 计算top-5分类正确率。}
        batchsize (每批量大小): int
        epoch(训练次数): int
        learningrate(学习率): float
        shuffle(数据清洗): bool, 默认为False
        verbose(训练进程):bool, 默认为True
        plots(绘图):bool, 默认为False
        momentum(动量): floot, 默认为0.9
        checkpointpath (模型保存路径): string
        executionenvironment（训练网络的硬件资源）:string, 默认为当前环境
        
    Returns:
        tuple(...).
    
    """
    return {"loss":loss, "optimizer":optimizer, "metrics":metrics, "batch_size":batch_size, "epoch":epoch, 
            "learning_rate":learning_rate, "shuffle":shuffle, "verbose":verbose, 
            "plots":plots, "momentum":momentum, "checkpointpath":checkpointpath, "executionenvironment":executionenvironment, "eval_data":eval_data, "eval_label":eval_label}

def trainnetwork(train_data, train_label, layers, options):
    """
    训练深度学习神经网络
    Args:
        train_data (训练数据集): numpy.ndarray
        train_label (训练数据集标签): numpy.ndarray
        layers (网络层): Network
        options (训练深度学习神经网络的选项): dict
        eval_data (验证数据集): numpy.ndarray
        eval_label (验证数据集标签): numpy.ndarray
    Returns:
        Model(model.tarin.result)
    
    """
    loss = options["loss"]
    opt = options["optimizer"]
    metrics = options["metrics"]
    metric = metrics
    batch_size = options["batch_size"]
    epoch = options["epoch"]
    learning_rate = options["learning_rate"]
    shuffle = options["shuffle"]
    verbose = options["verbose"]
    plots = options["plots"]
    momentum = options["momentum"]
    checkpoint_path = options["checkpointpath"]
    execution_environment = options["executionenvironment"]
    eval_data = options["eval_data"]
    eval_label = options["eval_label"]

    #选择计算图模式
    if platform.system() == 'Windows':
        #静态图模式
        ms.set_context(mode=0)
    else:
        ms.set_context(mode=0)

    #训练网络硬件环境选择
    if execution_environment == "auto":
        pass
    elif execution_environment == "GPU":
        ms.set_context(device_target="GPU")
    elif execution_environment == "CPU":
        ms.set_context(device_target="CPU")
    else:
        raise ValueError("Please enter the correct execution environment！")

    #数据类型转换
    train_data = np.array(train_data)
    train_label = np.array(train_label)

    #设置中间参数保存路径
    if os.name == "nt":
        train_file = os.path.join("C:/tmp/", "train_params.csv")
        eval_file = os.path.join("C:/tmp/", "eval_params.csv")
    elif os.name == "posix":
        train_file = os.path.join("/tmp/", "train_params.csv")
        eval_file = os.path.join("/tmp/", "eval_params.csv")
    
    #优化器
    Opt = ["Adadelta", "Adagrad", "Adam", "AdaMax", "AdamOffload", "AdamWeightDecay", 
           "ASGD", "LazyAdam", "Momentum", "RMSProp", "Rprop", "SGD"]
    if opt in Opt:
        if opt == "Momentum":
            opt = eval(opt+"(params=layers.trainable_params(), learning_rate=learning_rate, momentum=momentum)")
        else:
            opt = eval(opt+"(params=layers.trainable_params(), learning_rate=learning_rate)")
    else:
        raise ValueError("Please enter the correct optimizer function！") 

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
    loss = eval(loss+"()")

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
        """生成数据集"""
        dataset = GeneratorDataset(list(get_data(data, label)), column_names=['data', 'label'])
        #是否打乱数据
        if shuffle == True:
            ds.config.set_seed(0)
            dataset = dataset.shuffle(buffer_size=5)
            dataset = dataset.batch(batch_size)
            return dataset
        else:
            dataset = dataset.batch(batch_size)
            return dataset

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
    model = mindspore.train.Model(network=layers ,loss_fn=loss, optimizer=opt, metrics=metrics)

    #每次训练前判断中间参数是否存在
    if os.path.exists(train_file) == True:
        os.remove(train_file)
    if os.path.exists(eval_file) == True:
        os.remove(eval_file)

    #定义新类重写Callback类中on_train_step_end方法，保存训练过程中的损失函数值、循环次数、训练次数等
    class Save_train_param(mindspore.Callback):
        def on_train_step_end(self, run_context):
            loss = []
            cb_params = run_context.original_args()
            epoch_num = cb_params.cur_epoch_num
            step_num = cb_params.cur_step_num
            loss = cb_params.net_outputs
            loss = loss.asnumpy()
            train_dataframe = pd.DataFrame({'epoch_num':[epoch_num], 'step_num':[step_num], 'loss':[loss]})
            train_dataframe.to_csv(train_file, index=False, mode='a', sep=',', header=False)
    #调用Save_train_param类
    save_train_param = Save_train_param()

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
    
    # 删除中间文件
    if plots != True:
        if eval_data is not None and eval_label is not None:
            os.remove(train_file)
            os.remove(eval_file)
        else:
            os.remove(train_file)

    return model

#保存模型为mindir格式
def exportmindir(net, file_name, input_tensor):
    input_tensor = Tensor(input_tensor.astype(np.float32))
    return export(net, input_tensor, file_name=file_name, file_format="MINDIR")

#加载模型权重
def loadmodel(net, file):
    param_dict = mindspore.load_checkpoint(file)
    mindspore.load_param_into_net(net, param_dict)
    return net

def loadmindir(file_name):
    ms.set_context(mode=0)
    graph = ms.load(file_name)
    net = nn.GraphCell(graph)
    return net