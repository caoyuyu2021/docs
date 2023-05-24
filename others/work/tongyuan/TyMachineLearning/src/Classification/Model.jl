
using PyCall
# using Distances
# using LIBSVM
using CategoricalArrays
using TyPlot

#交叉验证的测试指标
function test(c)
    #复制测试集和训练集数据，其中c[1]==train, c[2]==test
    c1 = copy(c[1])
    c2 = copy(c[2])
    s = collect(1:length(append!(c1, c2)))
    #返回测试集观察的索引，值为 1 表示相应的观测值在测试集中，值为 0 表示对应的观测值在训练集中
    for i in eachindex(s)
        if s[i] in c[1]
            s[i] = 0
        else
            s[i] = 1
        end
    end
    c1 = []
    c2 = []
    return s
end

#计算部分相关性
# function partialDependence(ClassificationMdl, Vars::Int64, Data)
#     #类型赋值
#     # ClassificationTree = DecisionTree.Root
#     # ClassificationNB = NaiveBayes.GaussianNB
#     # ClassificationKNN = NearestNeighborModels.KNNResult
#     # ClassificationLDA = Tuple

#     #计算选取特征列的最大值，最小值
#     fmax, fmin = maximum(Data[:, Vars]), minimum(Data[:, Vars])
#     #计算最大最小值之间个数为100的步长
#     steps = (fmax - fmin) / (100 - 1)
#     #产生等距的100个随机特征点
#     frange = map(x -> round(x; digits=4), collect(fmin:steps:fmax))

#     preds = []
#     pred = []
#     n = size(unique(Data[:, end]))[1] #类别数
#     for i in frange
#         data = copy(Data)
#         data[:, Vars] .= i
#         #将每个随机特征点与整列数据做替换，将替换后的数据进行预测并计算均值
#         if typeof(ClassificationMdl) <: ClassificationTree #分类树
#             pred = [
#                 mean(
#                     apply_tree_proba(
#                         ClassificationMdl,
#                         Matrix(data[:, 1:(end - 1)]),
#                         unique(data[:, end]),
#                     )[
#                         :, i
#                     ],
#                 ) for i in 1:n
#             ]
#         elseif typeof(ClassificationMdl) <: ClassificationNB #朴素贝叶斯
#             pred = [
#                 mean(
#                     Matrix(
#                         NaiveBayes.predict_logprobs(
#                             ClassificationMdl, Matrix(Matrix(data[:, 1:(end - 1)])')
#                         )[2]',
#                     )[
#                         :, i
#                     ],
#                 ) for i in 1:n
#             ]
#         elseif typeof(ClassificationMdl) <: ClassificationKNN #最近邻
#             data = Array(data[:, 1:(end - 1)])
#             data = MLJBase.table(data)
#             p = MLJBase.predict(
#                 NearestNeighborModels.KNNClassifier(), ClassificationMdl, data
#             )
#             pgr = []
#             for i in 1:n
#                 pgr = append!(pgr, [p.prob_given_ref.vals[i]])
#             end
#             pred = [mean(Matrix(DataFrame(pgr, :auto))[:, i]) for i in 1:n]
#         elseif typeof(ClassificationMdl) <: ClassificationLDA #判别分析
#             data = Array(data[:, 1:(end - 1)])
#             data = MLJBase.table(data)
#             p = MLJBase.predict(
#                 MLJScikitLearnInterface.BayesianLDA(), ClassificationMdl, data
#             )
#             pgr = []
#             for i in 1:n
#                 pgr = append!(pgr, [p.prob_given_ref.vals[i]])
#             end
#             pred = [mean(Matrix(DataFrame(pgr, :auto))[:, i]) for i in 1:n]
#         end
#         #循环计算100次
#         preds = append!(preds, pred)
#     end

#     preds = map(x -> round(x; digits=4), preds)
#     #数据整合
#     pd = []
#     for i in 1:n
#         pd = append!(pd, [preds[collect(i:n:length(preds))]])
#     end
#     pd = DataFrame(pd, :auto)
#     return pd, frange
# end

function partialDependence(
    estimator,
    X,
    features;
    response_method="auto",
    percentiles=(0.05, 0.95),
    grid_resolution=100,
    method="auto",
    kind="average",
)
    #计算部分相关性
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.inspection import partial_dependence
    def Dummyvar(estimator, X, features, response_method, percentiles, grid_resolution, method, kind):
        pd = partial_dependence(estimator=estimator,X=X,features=features,response_method=response_method,percentiles=percentiles,grid_resolution=grid_resolution,method=method,kind=kind)
        average = pd["average"]
        values = pd["values"]
        return average, values
    """
    return py"Dummyvar"(
        estimator, X, features, response_method, percentiles, grid_resolution, method, kind
    )
end

#创建部分依赖图（PDP）和个别条件期望图（ICE）
# function plotPartialDependence(ClassificationMdl, Vars::Int64, Data)
#     pd, x = partialDependence(ClassificationMdl, Vars, Data)
#     n = size(unique(Data[:, end]))[1]
#     y = []
#     name = []
#     for i in 1:n
#         y = pd[:, i]
#         hold("on")
#         if i == 1
#             plot(x, y)
#             label = unique(Data[:, end])[i]
#             name1 = "$(label)"
#             name = append!(name, [name1])
#         elseif i == n
#             plot(x, y)
#             label = unique(Data[:, end])[i]
#             name1 = "$(label)"
#             name = append!(name, [name1])
#         else
#             plot(x, y)
#             label = unique(Data[:, end])[i]
#             name1 = "$(label)"
#             name = append!(name, [name1])
#         end
#         legend(name)
#         hold("off")
#     end
# end

#将预测结果转化为标签向量
function preclasses1(ypred)
    ypredclasses = []
    for i in eachindex(ypred.prob_given_ref.vals[1])
        yprednum = []
        maxindex = 0 #初始化最大值对应下标
        maxnum = 0 #初始化最大值
        #将每个目标值对应概率进行拼接
        for j in eachindex(ypred.decoder.classes)
            yprednum = append!(yprednum, ypred.prob_given_ref.vals[j][i])
        end
        #输出每个拼接组对应概率最大的目标值
        for k in eachindex(ypred.decoder.classes)
            if yprednum[k] > maxnum
                maxnum = yprednum[k]
                maxindex = k
            end
        end
        ypredclasses = append!(ypredclasses, [unique(ypred.decoder.classes)[maxindex]])
    end
    #返回标签向量
    return ypredclasses
end

#将预测结果转化为标签向量
function preclasses2(ypred)
    ypredclasses = []
    for i in eachindex(ypred[1])
        yprednums = []
        freqs = Dict()
        maxnum = 0 #初始化最大值
        maxindex = 0 #初始化最大值的下标

        #将每个目标值对应概率进行拼接
        for j in eachindex(ypred)
            yprednums = append!(yprednums, [ypred[j][i]])
        end

        #将每种目标值出现次数进行计数，拼接成字典
        for xi in Array(yprednums)
            freqs[xi] = get(freqs, xi, 0) + 1
        end

        #分别获取字典的键和值
        yvalues = collect(values(freqs))
        ykeys = collect(keys(freqs))

        #输出出现次数最多的目标值对应的下标
        for k in eachindex(yvalues)
            if yvalues[k] > maxnum
                maxnum = yvalues[k]
                maxindex = k
            end
        end
        ypredclasses = append!(ypredclasses, [ykeys[maxindex]])
    end
    #返回出现次数最多的标签向量
    return ypredclasses
end

#用观测数据预测标签
function predict(mdl, Xnew)
    #类型赋值
    # ClassificationTree = DecisionTree.Root
    # ClassificationNB = NaiveBayes.GaussianNB
    # ClassificationKNN = NearestNeighborModels.KNNResult
    # ClassificationLDA = Tuple
    # ClassificationSVM = LIBSVM.SVM

    # if typeof(mdl) <: ClassificationTree #分类树
    #     Xnew = Array(Xnew)
    #     ypred = DecisionTree.apply_tree(mdl, Xnew)
    #     return ypred
    # elseif typeof(mdl) <: ClassificationNB #朴素贝叶斯
    #     Xnew = Array(Array(Xnew)')
    #     ypred = NaiveBayes.predict(mdl, Xnew)
    #     return ypred
    # elseif typeof(mdl) <: ClassificationKNN #最近邻
    #     Xnew = Array(Xnew)
    #     ypred = MLJBase.predict(KNNClassifier(), mdl, Xnew)
    #     ypred = preclasses1(ypred)
    #     return ypred
    # elseif typeof(mdl) <: ClassificationLDA #判别分析
    #     Xnew = Array(Xnew)
    #     ypred = MLJBase.predict(MLJScikitLearnInterface.BayesianLDA(), mdl, Xnew)
    #     ypred = preclasses1(ypred)
    #     return ypred
    # if typeof(mdl) <: ClassificationSVM #支持向量机
    #     Xnew = Array(Array(Xnew)')
    #     ypred, _ = svmpredict(mdl, Xnew)
    #     return ypred
    # elseif typeof(mdl) <: PyObject #Python类
    py"""
    from sklearn.multiclass import OutputCodeClassifier
    from sklearn.semi_supervised import LabelPropagation
    from sklearn.semi_supervised import SelfTrainingClassifier
    from sklearn.svm import LinearSVC
    from sklearn.svm import SVC
    import statsmodels.api as sm
    from statsmodels.regression import linear_model
    def Predict(clf, Xnew):
        if isinstance(clf, linear_model.RegressionResultsWrapper):
                # 线性回归模型 predict，对输入数据添加截距
            return clf.predict(sm.add_constant(Xnew))
        return clf.predict(Xnew)
    """
    ypred = py"Predict"(mdl, Xnew)
    return ypred
end


#交叉验证机器学习模型
function crossval(mdl, data, cv)
    cvData = copy(data)
    #每次交叉验证选取序列的对应向量
    cvs = collect(KFold(size(data)[1], cv))
    cvd = [] #交叉验证剩余序列
    misrate = [] #误分类率
    for i in 1:cv
        cvrs = setdiff(Set(collect(1:size(data)[1])), Set(cvs[i])) #集合相减
        #将集合类型转为向量
        for k in keys(cvrs.dict)
            cvd = append!(cvd, k)
        end
        #划分测试集
        X_test = Matrix(cvData[cvd, 1:(end - 1)])
        y_test = cvData[cvd, end]
        #预测标签
        ypred = TyMachineLearning.predict(mdl, X_test)
        #计算误分类率
        misrate = append!(misrate, 1 - mean(ypred .== y_test) * 1.0)
    end
    return misrate
end

#交叉验证分类模型的分类损失
function kfoldLoss(CVMdl)
    return round(mean(CVMdl); digits=4)
end

# 交叉验证分类模型中的观测分类
# function kfoldPredict(mdl, data, cv)
# cvData = copy(data)
# 每次交叉验证选取序列的对应向量
# cvs = collect(Kfold(size(data)[1], cv))
# cvd = [] #交叉验证剩余序列
# ypred = []
# for i in 1:cv
# cvrs = setdiff(Set(collect(1:size(data)[1])), Set(cvs[i])) #集合相减
# 将集合类型转为向量
# for k in keys(cvrs.dict)
# cvd = append!(cvd, k)
# end
# 划分测试集
# X_test = cvData[cvd, 1:(end - 1)]
# 预测标签
# y = TyMachineLearning.predict(mdl, X_test)
# ypred = append!(ypred, [y])
# end
# return preclasses2(ypred)
# end

function kfoldPredict(mdl, x, y, cv)
    if typeof(mdl) <: PyObject
        py"""
        from sklearn.model_selection import cross_val_predict
        def kfold(mdl, x, y, cv):
            y_pred = cross_val_predict(mdl, x, y, cv=cv)
            return y_pred
        """
        return py"kfold"(mdl, x, y, cv)
    else
        data = [x y]
        cvData = copy(data)
        #每次交叉验证选取序列的对应向量
        cvs = collect(Kfold(size(data)[1], cv))
        cvd = [] #交叉验证剩余序列
        ypred = []
        for i in 1:cv
            cvrs = setdiff(Set(collect(1:size(data)[1])), Set(cvs[i])) #集合相减
            #将集合类型转为向量
            for k in keys(cvrs.dict)
                cvd = append!(cvd, k)
            end
            #划分测试集
            X_test = cvData[cvd, 1:(end - 1)]
            X1 = Array(X_test)
            #预测标签
            y = TyMachineLearning.predict(mdl, X1)
            ypred = append!(ypred, [y])
        end
        return preclasses2(ypred)
    end
end

#基于卡方检验的单变量特征分类排序
function fscchi2(X, y)
    X = Array(X)
    y = Array(y)
    py"""
    from sklearn.feature_selection import chi2
    import pandas as pd
    import numpy as np
    #训练模型
    def Fscchi2(X, y):
        X = np.abs(X)
        res = pd.DataFrame({"idx":np.arange(chi2(X, y)[1].shape[0])+1, "scores":-np.log(chi2(X, y)[1])})
        ress = res.sort_values(by='scores',ascending=False)
        return (res, ress)
    """
    return py"Fscchi2"(X, y)[1]["idx"].values, py"Fscchi2"(X, y)[2]["scores"].values
end

#为分类问题创建混淆矩阵图
function confusionchart(trueLabels, predictedLabels)
    py"""
    from sklearn.metrics import ConfusionMatrixDisplay
    from sklearn.preprocessing import LabelEncoder
    import matplotlib.pyplot as plt
    import numpy as np
    import matplotlib as mpl
    
    def Confusionchart(trueLabels,predictedLabels):
        y_true = np.array(trueLabels)
        y_pred = np.array(predictedLabels)
        #改写标签
        label_encoder = LabelEncoder()
        x = np.concatenate([y_true, y_pred])
        y = label_encoder.fit_transform(x)
        y_true = y[: len(y_true)]
        y_pred = y[len(y_pred) :]
        #绘制混淆矩阵
        ConfusionMatrixDisplay.from_predictions(y_true, y_pred)
        return plt.show()
    """
    py"Confusionchart"(trueLabels, predictedLabels)
end

#分类问题的混淆矩阵计算
function confusionmat(group, grouphat)
    py"""
    from sklearn.preprocessing import LabelEncoder
    from sklearn.metrics import confusion_matrix
    import numpy as np
    
    def Confusionmat(trueLabels,predictedLabels):
        y_true = np.array(trueLabels)
        y_pred = np.array(predictedLabels)
        #改写标签
        label_encoder = LabelEncoder()
        x = np.concatenate([y_true, y_pred])
        y = label_encoder.fit_transform(x)
        y_true = y[: len(y_true)]
        y_pred = y[len(y_pred) :]
        #计算混淆矩阵
        return confusion_matrix(y_true, y_pred)
    """
    py"Confusionmat"(group, grouphat)
end

#分类器输出的接收机工作特性（ROC）曲线或其他性能曲线
function perfcurve(labels, scores)
    py"""
    from sklearn.preprocessing import LabelEncoder
    from sklearn.metrics import roc_curve
    import numpy as np
    
    def Perfcurve(trueLabels, predictedLabels):
        y_true = np.array(trueLabels)
        y_pred = np.array(predictedLabels)
        #改写标签
        label_encoder = LabelEncoder()
        x = np.concatenate([y_true, y_pred])
        y = label_encoder.fit_transform(x)
        y_true = y[: len(y_true)]
        y_pred = y[len(y_pred) :]
        #计算接收机工作特性
        fpr, tpr, thresholds = roc_curve(y_true, y_pred)
        return fpr, tpr, thresholds
    """
    py"Perfcurve"(labels, scores)
end
