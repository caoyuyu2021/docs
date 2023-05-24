using PyCall
using TyPlot

#适合多类分类的二叉决策树
# function fitctree(X, y)
#     X = Array(X)
#     y = Array(y)
#     return build_tree(y, X)
# end

function fitctree(
    X,
    y;
    criterion="gini",
    splitter="best",
    max_depth=nothing,
    min_samples_split=2,
    min_samples_leaf=1,
    min_weight_fraction_leaf=0,
    min_impurity_decrease=0.0,
    ccp_alpha=0.0,
)
    #创建决策树分类模型
    py"""
    from sklearn.tree import DecisionTreeClassifier
    def Dummyvar(X, y, criterion,splitter,max_depth,min_samples_split,min_samples_leaf,min_weight_fraction_leaf,min_impurity_decrease,ccp_alpha):
        clf = DecisionTreeClassifier(random_state=1, 
                            criterion=criterion,
                            splitter=splitter,
                            max_depth=max_depth,
                            min_samples_split=min_samples_split,
                            min_samples_leaf=min_samples_leaf,
                            min_weight_fraction_leaf=min_weight_fraction_leaf,
                            min_impurity_decrease=min_impurity_decrease,
                            ccp_alpha=ccp_alpha,
                            ).fit(X, y)               
        return clf
    """
    return py"Dummyvar"(
        X,
        y,
        criterion,
        splitter,
        max_depth,
        min_samples_split,
        min_samples_leaf,
        min_weight_fraction_leaf,
        min_impurity_decrease,
        ccp_alpha,
    )
end

#分类树的预测重要性估计
function predictorImportance(X, y)
    X = Array(X)
    y = Array(y)
    py"""
    from sklearn.tree import DecisionTreeClassifier
    def PredictorImportance(X, y):
        #训练模型
        tree = DecisionTreeClassifier()
        tree.fit(X, y)
        tf = tree.feature_importances_
        return tf
    """
    py"PredictorImportance"(X, y)
end

#视图分类树
# function view(tree)
# return print_tree(tree)
# end

function view(tree)
    if typeof(tree) <: PyObject
        py"""
        import sklearn
        from sklearn.tree import plot_tree
        import matplotlib.pyplot as plt
        import matplotlib as mpl
        def View(tree):
            sklearn.tree.plot_tree(tree)
            return plt.show()
        """
        return py"View"(tree)
    else
        return print_tree(tree)
    end
end

#分类树剪枝
# function prunetree(tree, per)
#     return prune_tree(tree, per)
# end
function prune(tree, X, y, ccp_alpha)
    #knn集成学习
    py"""
    import pandas as pd
    import numpy as np
    def Dummyvar(tree, X, y, ccp_alpha):
        Dic = tree.get_params()
        criterion = Dic["criterion"]
        splitter = Dic["splitter"]
        max_depth = Dic["max_depth"]
        min_samples_split = Dic["min_samples_split"]
        min_samples_leaf = Dic["min_samples_leaf"]
        min_weight_fraction_leaf = Dic["min_weight_fraction_leaf"]
        min_impurity_decrease = Dic["min_impurity_decrease"]
        clf = DecisionTreeClassifier(random_state=1, 
                            criterion=criterion,
                            splitter=splitter,
                            max_depth=max_depth,
                            min_samples_split=min_samples_split,
                            min_samples_leaf=min_samples_leaf,
                            min_weight_fraction_leaf=min_weight_fraction_leaf,
                            min_impurity_decrease=min_impurity_decrease,
                            ccp_alpha=ccp_alpha,
                            ).fit(X, y) 
        return clf
    """
    return py"Dummyvar"(tree, X, y, ccp_alpha)
end

"""
    function margin(tree, X, y): 计算分类边距，正确类别的后验概率和错误类别后验概率最大值之差 
    
    args: 
        tree: 分类器 
        X: 数据集 
        y: 标签 
"""
function margin(tree, X, y)
    post_probs = tree.predict_proba(X)
    classes = tree.classes_
    margins = zeros(size(X)[1])

    for idx in 1:size(post_probs)[1]
        # TODO: 真实类别和 proba 的对应关系，
        # 标准的是使用 `Julia: get_classes(model), Python: clf.classes_` 获取类别的索引
        real_class_idx = findfirst(==(y[idx]), classes)  # 真实类别的索引
        real_prob = post_probs[idx, real_class_idx]
        margins[idx] =
            real_prob - findmax(filter(x -> x != real_prob, post_probs[idx, :]))[1]
    end

    return margins
end

"""
    function edge(tree, X, y; weights=ones(size(X, 1), 1)): 分类边缘，分类边距的加权平均

    args:
        tree: 分类器
        X: 数据集
        y: 标签
        weights(optional, defaul=ones(size(X, 1), 1)): 
            对margins进行加权平均的权值
"""
function edge(tree, X, y; weights=ones(size(X, 1), 1))
    margins = margin(tree, X, y)
    edge = mean(weights[:, 1] .* margins)
    return edge
end

"""
    KFold(data, k::Int): 用于交叉验证的 k-fold 数据集划分

    args: 
        data: 数据集，指定为一个 row*column 的 Matrix 或 DataFrame
        k: 折数，交叉验证的折数
    returns:
        k_fold: 一个大小为 k 的 tuple. tuple 中的每一个元素为一个大小为 2 的 Vector，
                Vector[1] 为 data 中训练集的索引，Vector[2] 为 data 中测试集的索引。
"""
function KFold(data, k::Int)
    n = size(data, 1)
    indices = shuffle(1:n)
    fold_size = Int(ceil(n / k))
    folds = [indices[((i - 1) * fold_size + 1):min(i * fold_size, n)] for i in 1:k]
    k_fold = [(vcat(filter(x -> x != folds[i], folds)...), folds[i]) for i in 1:k]
    return k_fold
end

""" 
    function kfoldfun(mdl, data, cv, fun) 将函数 `fun` 用作交叉验证的评价指标

    args: 
        mdl: 机器学习模型。
        data: 包含数据和标签的预测数据，指定为矩阵或数组。每行数据对应一个观察值，每列对应一个变量。最后一列为标签值。
        cv: 交叉验证的折数。
        fun: 交叉验证所用的评价函数
    return:
        score: 交叉验证的结果，score 包含了每个 fold 的验证结果，并将验证结果纵向连接为一个数值型 Vector. 
        
"""
function kfoldfun(mdl, data, cv, fun)
    cvData = copy(data)
    kf = KFold(cvData, cv)
    score = []  # losses
    for (_, test_idx) in kf
        X_test, y_test = cvData[test_idx, 1:(end - 1)], cvData[test_idx, end]
        ypred = TyMachineLearning.predict(mdl, X_test)
        fold_score = fun(y_test, ypred)
        score = append!(score, fold_score)
    end
    return score
end

"""
    function kfoldMargin(mdl, data, cv): 计算交叉验证的分类边距
    
    args: 
        mdl: 用于交叉验证的模型
        data: 用于交叉验证的数据
        cv: 交叉验证的折数
    returns:
        margins: 一个 (n, 1) 的 Vector，其中 n 是交叉验证的观测值的总数。
"""
function kfoldMargin(mdl, data, cv)
    cvData = copy(data)
    kf = KFold(cvData, cv)
    margins = []
    for (_, test_idx) in kf
        X_test, y_test = cvData[test_idx, 1:(end - 1)], cvData[test_idx, end]
        #计算分类边距
        fold_margin = margin(mdl, X_test, y_test)
        append!(margins, fold_margin)
    end
    return margins
end

"""
    kfoldEdge(mdl, data, cv; Mode="average"): 计算交叉验证的分类边缘

    args:
        mdl: 用于交叉验证的模型 
        data: 用于交叉验证的数据 
        cv: 交叉验证的折数 
        Mode(optional, default="average"): 计算分类边缘的模式，默认为 average，
                                        返回所有 fold 分类边缘的均值 
    returns:
        kfold_edge: 交叉验证的分类边缘 
"""
function kfoldEdge(mdl, data, cv; Mode="average")
    if Mode == "average"
        kfold_edge = mean(kfoldMargin(mdl, data, cv))
        return kfold_edge
    end
end