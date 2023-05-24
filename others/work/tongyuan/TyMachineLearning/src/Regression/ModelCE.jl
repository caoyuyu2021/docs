using PyCall

function fsrftest(X, y)
    X = Array(X)
    y = Array(y)
    #广义线性模型的套索或弹性网正则化
    py"""
    from sklearn import feature_selection as FS
    def Fsrftest(X, y):
        fv, pv = FS.f_regression(X, y)
        return fv, pv
    """
    return py"Fsrftest"(X, y)
end

function oobPermutedPredictorImportance(mdl)
    #广义线性模型的套索或弹性网正则化
    py"""
    def lasso_my(mdl):
        res = mdl.feature_importances_
        return res
    """
    return py"lasso_my"(mdl)
end

function convent_columns(X, list_name)
    #将不可处理的列中的str转换成int
    y = names(X)
    X = Array(X)
    py"""
    import pandas as pd
    def lasso_my(X, y, list_name):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        df1 = data1[list_name]
        liit_key = list(set(df1.values))
        list_val = list(range(len(liit_key)))
        dic = dict(zip(liit_key,list_val))
        column = []
        for i in range(len(df1.values)):
            for k in dic.keys():
                if df1.values[i] == k:
                    column.append(dic[k])
        data1[list_name] = column
        A = data1.iloc[:,:-1]
        A = A.copy()
        B = data1.iloc[:,-1]
        B = B.copy()
        return A, B, dic
    """
    return py"lasso_my"(X, y, list_name)
end

function coeftest(mdl, A)
    #线性回归模型的方差分析
    py"""
    import pandas as pd
    import numpy as np
    import statsmodels.api
    from statsmodels.formula.api import ols
    from statsmodels.stats.anova import anova_lm
    def CoefTest(mdl, A):
        f_test = mdl.f_test(A)
        return f_test
    """
    return py"CoefTest"(mdl, A)
end

function get_xtest(X, x_name)
    y = names(X)
    X = Array(X)
    #获取x观测值
    py"""
    def Get_xtest(X, y, x_name):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        X_test = data1[x_name]
        return X_test
    """
    return py"Get_xtest"(X, y, x_name)
end

function predictorImportance_tree(mdl)
    #回归树的预测重要性估计
    py"""
    def PredictorImportance(mdl):
        fi = mdl.feature_importances_
        return fi
    """
    return py"PredictorImportance"(mdl)
end

function plotpartialDependence(model, x, features)
    #预测的响应之间的部分相关性
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.impute import SimpleImputer
    import matplotlib.pyplot as plt
    import matplotlib as mpl
    from sklearn.inspection import PartialDependenceDisplay
    def pd (model, x, features):
        PartialDependenceDisplay.from_estimator(model, x, features)
        return plt.show()
    """
    return py"pd"(model, x, features)
end
