using TyPlot

function predictorImportance(mdl)
    #非线性回归预测响应
    py"""
    def pd(mdl):
        fi = mdl.feature_importances_
        return fi
    """
    return py"pd"(mdl)
end

# function crossval_tree(clf, X, y)
#     #交叉验证决策树
#     py"""
#     from sklearn.model_selection import cross_val_score
#     def Crossval(clf, X, y):
#         scores = cross_val_score(clf, X, y, cv=5, scoring='r2')
#         return scores
#     """
#     return py"Crossval"(clf, X, y)
# end

# function kfoldPredict_tree(clf, X, y)
#     #预测未用于训练的观察结果的反应
#     py"""
#     import pandas as pd
#     import numpy as np
#     from sklearn.model_selection import cross_val_predict 
#     def KfoldPredict(clf, X, y):
#         y_pred = cross_val_predict(clf, X, y, cv=10)
#         return y_pred
#     """
#     return py"KfoldPredict"(clf, X, y)
# end

function kfoldLoss(y_true, y_pred)
    #在交叉验证回归模型中预测观测响应
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.metrics import mean_squared_error
    def KfoldLoss(y_true, y_pred):
        ls = mean_squared_error(y_true, y_pred)
        return ls
    """
    return py"KfoldLoss"(y_true, y_pred)
end

# function view_py(clf)
#     #交叉验证决策树
#     py"""
#     import sklearn
#     from sklearn.tree import plot_tree
#     import matplotlib.pyplot as plt
#     import matplotlib as mpl
#     def View(clf):
#         sklearn.tree.plot_tree(clf)
#         return plt.show()
#     """
#     return py"View"(clf)
# end

function fitrtree(
    X,
    y;
    criterion="squared_error",
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
    from sklearn.tree import DecisionTreeRegressor
    def Dummyvar(X, y, criterion,splitter,max_depth,min_samples_split,min_samples_leaf,min_weight_fraction_leaf,min_impurity_decrease,ccp_alpha):
        clf = DecisionTreeRegressor(random_state=1, 
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
