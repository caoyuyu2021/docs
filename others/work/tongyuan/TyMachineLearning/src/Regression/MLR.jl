using GLM
using PyCall

#多元线性回归
function regress(X, modelspec)
    y = names(X)
    X = Array(X)
    #创建多元线性回归模型
    py"""
    import pandas as pd
    import numpy as np
    import statsmodels.api
    from statsmodels.formula.api import ols
    from statsmodels.stats.anova import anova_lm
    def modeled(X, y, modelspec):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        model = ols(modelspec, data1).fit()
        x = data1.iloc[:,:-1]
        y = data1.iloc[:,-1]
        x1 = x.values
        y1 = y.values
        return model, x, y1
    """
    return py"modeled"(X, y, modelspec)
end

function loss(mdl, X, y)
    #非线性回归预测响应
    py"""
    from sklearn.metrics import mean_squared_error
    def Loss_rgp (mdl, X, y):
        y_val = mdl.predict(X)
        ls = mean_squared_error(y, y_val)
        return ls
    """
    return py"Loss_rgp"(mdl, X, y)
end

function feval(mdl, args...)
    L = length(args)
    (i, j) = size(args[1])
    lis = []
    for i in 1:L
        ypre = TyMachineLearning.predict(mdl, args[i])
        append!(lis, ypre)
    end
    M = reshape(lis, (L, i))
    return M
end

function anova(mdl, anovatype)
    #线性回归模型的方差分析
    py"""
    import pandas as pd
    import numpy as np
    import statsmodels.api
    from statsmodels.formula.api import ols
    from statsmodels.stats.anova import anova_lm
    def Anova (mdl, anovatype):
        anovat = anova_lm(mdl)
        anovat_s = mdl.summary()
        if anovatype == 'component':
            return anovat
        elif anovatype == 'summary':
            return anovat_s
    """
    return py"Anova"(mdl, anovatype)
end

function Mdl_coet(data)
    data = Array(data)
    #生成py模型
    py"""
    import pandas as pd
    import numpy as np
    import statsmodels.api
    from statsmodels.formula.api import ols
    from statsmodels.stats.anova import anova_lm
    def modeled (data):
        data = pd.DataFrame(data)
        data = data.rename(columns={0:'Y', 1:'x1', 2:'x3',3:'x2'})
        data = data.dropna()
        model = ols(formula="Y~x1+x2+x3", data=data).fit()
        return model
    """
    return py"modeled"(data)
end

function coefCI(mdl, alpha)
    #线性回归模型系数估计的置信区间
    py"""
    import pandas as pd
    import numpy as np
    def CoefCI (mdl, alpha):
        res = mdl.conf_int(alpha)
        return res[0],res[1]
    """
    return py"CoefCI"(mdl, alpha)
end

function kfoldPredict(X, y)
    X = Array(X)
    y = Array(y)
    # 预测未用于训练的观察结果的反应
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.linear_model import Lasso
    from sklearn import linear_model
    from sklearn.model_selection import cross_val_predict
    def KfoldPredict (X, y):
        X = pd.DataFrame(X)
        y = pd.DataFrame(y)
        lasso = linear_model.Lasso()
        y_pred = cross_val_predict(lasso, X, y, cv=10)
        return y_pred
    """
    return py"KfoldPredict"(X, y)
end

function dwtest(model)
    #带剩余输入的Durbin-Watson检验
    py"""
    import pandas as pd
    import numpy as np
    from statsmodels.stats.stattools import durbin_watson
    def Dwtest (model):
        dw =durbin_watson(model.resid)
        # dw 是Durbin-Watson统计量值，在1.5-2.5之间则表明残差项之间是不相关的；如果与2偏离的较远，则说明不满足残差的独立性假设。
        return dw
    """
    return py"Dwtest"(model)
end

function Mdl_dw(x, y, modelspec)
    #生成py模型
    py"""
    import pandas as pd
    import numpy as np
    import statsmodels.api
    from statsmodels.formula.api import ols
    from statsmodels.stats.anova import anova_lm
    def modeled (x, y, modelspec):
        X = pd.DataFrame(x)
        y = pd.DataFrame(y)
        df = pd.concat([X,y],axis=1,ignore_index=True)
        df = df.copy()
        data = df.rename(columns={0:"x", 1:"y"})
        model = ols(modelspec, data).fit()
        return model
    """
    return py"modeled"(x, y, modelspec)
end

function selectModels(model, idx)
    #选择拟合的正则线性回归模型
    py"""
    import numpy as np
    from sklearn.datasets import load_diabetes
    from sklearn.feature_selection import SelectFromModel
    from sklearn.linear_model import LassoCV
    def SelectModels (model, idx):
        sfm = SelectFromModel(model, threshold=idx)
        return sfm
    """
    return py"SelectModels"(model, idx)
end

function Mdl_SM()
    #生成py模型
    py"""
    import numpy as np
    from sklearn.datasets import load_diabetes
    from sklearn.feature_selection import SelectFromModel
    from sklearn.linear_model import LassoCV
    def modeled ():
        diabetes = load_diabetes()
        X = diabetes.data
        y = diabetes.target
        clf = LassoCV().fit(X, y)
        return X, y, clf
    """
    return py"modeled"()
end

function plsregress(X, y, ncomp)
    X = Array(X)
    y = Array(y)
    #偏最小二乘回归
    py"""
    from sklearn.cross_decomposition import PLSRegression
    import pandas as pd
    import numpy as np
    def Plsregress(X, y, ncomp):
        x = np.array(X)
        y = np.array(y)
        plsr = PLSRegression(n_components=ncomp)
        lr = plsr.fit(x, y)
        XL = lr.x_loadings_
        YL = lr.y_loadings_
        return lr, x, y
    """
    return py"Plsregress"(X, y, ncomp)
end

function plspctvar(X, y)
    #取方差在总体的占比
    py"""
    from sklearn.cross_decomposition import PLSRegression
    import pandas as pd
    import numpy as np
    import sys 
    def PlsPctVar(X, y):
        x = np.mat(X)
        y = np.mat(y)
        x1 = []
        y1 = []
        for i in range(10):
            x1.append(np.var(x[:,i]))#取方差
            y1.append(np.var(y[:,i]))
        xa = np.sum(x1)#求和
        ya = np.sum(y1)
        xp = []
        yp = []
        for j in range(len(x1)):
           xp.append(x1[j]/xa) #计算比例
           yp.append(y1[j]/ya)
        return xp, yp
    """
    return py"PlsPctVar"(X, y)
end

function fitlme(X, formula, group)
    y = names(X)
    X = Array(X)
    #拟合线性混合效应模型
    py"""
    import statsmodels.formula.api as smf
    import pandas as pd
    import numpy as np
    import os
    def fitlme_my(X, y, formula, group):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        md = smf.mixedlm(formula, data1, groups=data1[group])
        mdf = md.fit()
        return mdf
    """
    return py"fitlme_my"(X, y, formula, group)
end

function fitlm(X, modelspec)
    y = names(X)
    X = Array(X)
    #创建多元线性回归模型
    py"""
    import pandas as pd
    import numpy as np
    import statsmodels.api
    from statsmodels.formula.api import ols
    from statsmodels.stats.anova import anova_lm
    def modeled(X, y, modelspec):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        model = ols(modelspec, data1).fit()
        x = data1.iloc[:,:-1]
        y = data1.iloc[:,-1]
        x1 = x.values
        y1 = y.values
        return model, x, y1
    """
    return py"modeled"(X, y, modelspec)
end

function polyconf(X, xx, y, degree, alpha)
    #多项式回归置信区间
    py"""
    import numpy as np
    import matplotlib.pyplot as plt
    import matplotlib as mpl
    from scipy import stats
    from sklearn.preprocessing import PolynomialFeatures
    from sklearn.linear_model import LinearRegression
    import math
    def get_polymodel(X, xx, y, degree, alpha):
        lr = LinearRegression()
        pf=PolynomialFeatures(degree=degree)
        lr.fit(pf.fit_transform(X), y)
        xx2 = pf.transform(xx[:, np.newaxis])
        yy2 = lr.predict(xx2)
        ci = stats.t.interval(alpha, df=len(yy2)-1,loc=np.mean(yy2),scale=stats.sem(yy2))
        #plt.plot(xx ,yy2, c='r')
        return yy2, ci
    """
    return py"get_polymodel"(X, xx, y, degree, alpha)
end

function polyfit(X, y, degree)
    #多项式曲线拟合
    py"""
    import numpy as np
    import matplotlib.pyplot as plt
    from sklearn.preprocessing import PolynomialFeatures
    from sklearn.linear_model import LinearRegression
    import math
    def get_polymodel(X, y, degree):
        lr = LinearRegression()
        pf=PolynomialFeatures(degree=degree)
        lr.fit(pf.fit_transform(X), y)
        x1 = pf.fit_transform(X)
        return lr, x1, y
    """
    return py"get_polymodel"(X, y, degree)
end

function get_datapoly()
    #获取poly数据
    py"""
    import numpy as np
    import matplotlib.pyplot as plt
    from sklearn.preprocessing import PolynomialFeatures
    from sklearn.linear_model import LinearRegression
    import math
    def get_polymodel():
        X = np.sort((4*math.pi) * np.random.rand(160, 1), axis=0)  
        y = np.sin(X).ravel()   
        # 噪音
        y[::5] += 2.5 * (0.5 - np.random.rand(32))
        xx = np.linspace(0, 4*math.pi, 200)
        return X, xx,y
    """
    return py"get_polymodel"()
end

function poly_line(X, xx, y, degree)
    #画出拟合曲线图
    py"""
    import numpy as np
    import matplotlib.pyplot as plt
    import matplotlib as mpl
    from sklearn.preprocessing import PolynomialFeatures
    from sklearn.linear_model import LinearRegression
    import math
    def get_polymodel(X, xx, y, degree):
        lr = LinearRegression()
        pf=PolynomialFeatures(degree=degree)
        lr.fit(pf.fit_transform(X), y)
        xx2 = pf.transform(xx[:, np.newaxis])
        yy2 = lr.predict(xx2)
        plt.plot(xx ,yy2,c='r')
        return plt.show()
    """
    return py"get_polymodel"(X, xx, y, degree)
end

function robustfit(
    X,
    y;
    wfun="huber",
    epsilon=1.35,
    max_iter=100,
    alpha=0.0001,
    warm_start=false,
    fit_intercept=true,
    tol=1e-05,
    copy_X=true,
    max_subpopulation=10000.0,
    n_subsamples=nothing,
    verbose=false,
)
    #拟合k近邻分类器
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.linear_model import HuberRegressor, LinearRegression
    def Dummyvar(X, y, wfun, epsilon, max_iter, alpha, warm_start, fit_intercept, tol, copy_X, max_subpopulation, n_subsamples, verbose):
        if wfun == "huber":
            clf = HuberRegressor(epsilon=epsilon,max_iter=max_iter,alpha=alpha, warm_start=warm_start, fit_intercept=fit_intercept, tol=tol)
        elif wfun == "TheilSenRegressor":
            clf = TheilSenRegressor(copy_X=copy_X,max_subpopulation=max_subpopulation,n_subsamples=n_subsamples,fit_intercept=fit_intercept)
        clf.fit(X, y)
        return clf
    """
    return py"Dummyvar"(
        X,
        y,
        wfun,
        epsilon,
        max_iter,
        alpha,
        warm_start,
        fit_intercept,
        tol,
        copy_X,
        max_subpopulation,
        n_subsamples,
        verbose,
    )
end

function fitrlinear(
    X,
    y;
    epsilon=0.0,
    tol=0.0001,
    C=1.0,
    loss="epsilon_insensitive",
    fit_intercept=true,
    intercept_scaling=1.0,
    dual=true,
    verbose=0,
    random_state=nothing,
    max_iter=1000,
)
    #对高维数据拟合线性回归模型
    py"""
    from sklearn.svm import LinearSVR
    def Dummyvar(X, y, epsilon, tol, C, loss, fit_intercept, intercept_scaling, dual, verbose, random_state, max_iter):
        regr = LinearSVR(epsilon=epsilon, random_state=random_state, tol=tol, C=C, loss=loss, fit_intercept=fit_intercept, intercept_scaling=intercept_scaling, dual=dual, max_iter=max_iter, verbose=verbose)
        regr.fit(X, y)
        return regr
    """
    return py"Dummyvar"(
        X,
        y,
        epsilon,
        tol,
        C,
        loss,
        fit_intercept,
        intercept_scaling,
        dual,
        verbose,
        random_state,
        max_iter,
    )
end

""" 
    stepwiselm(X, y; initial_list=[], PEnter=0.01, PRemove=0.05, verbose=true): 使用逐步回归创建线性回归模型

    args: 
        X: 特征数据，指定为一个 row * col 的 Matrix，或一个 DataFrame
        y: 标签值，指定为一个 row * 1 的 Vector
        initial_list(optinal, default=[]): 初始的特征，包含了初始化模型训练时需要使用的特征的列名的 Vector（若 X 为 Matrix，则使用 ["X_1", "X_2", ..., "X_n"] 表示）
        PEnter(optinal, default=0.01): 添加特征的阈值
        PRemove(optinal, default=0.05): 去除特征的阈值
        verbose(optinal, default=true): 是否输出细节信息
    Returns: 
        model: 线性回归模型 
"""
function stepwiselm(X, y; initial_list=[], PEnter=0.01, PRemove=0.05, verbose=true)
    py"""
    import statsmodels.api as sm
    import pandas as pd

    def stepwiselm(X, y, 
                    initial_list=[], 
                    PEnter=0.01, 
                    PRemove = 0.05, 
                    verbose=True):
        assert PEnter < PRemove, f'PEnter 必须小于 PRemove: (PEnter={PEnter}, PRemove={PRemove})'

        if not isinstance(X, pd.DataFrame): 
            X = pd.DataFrame(X, columns=['X_'+ str(i+1)  for i in range(X.shape[1])])

        included = list(initial_list)
        model = None
        while True:
            changed=False
            # forward step
            excluded = list(set(X.columns)-set(included))
            new_pval = pd.Series(index=excluded, dtype='float64')
            for new_column in excluded:
                model = sm.OLS(y, sm.add_constant(pd.DataFrame(X[included+[new_column]]))).fit()
                new_pval[new_column] = model.pvalues[new_column]
            best_pval = new_pval.min()
            if best_pval < PEnter:
                best_feature = new_pval.idxmin()
                included.append(best_feature)
                changed=True
                if verbose:
                    print('Add  {:30} with p-value {:.6}'.format(best_feature, best_pval))

            # backward step
            model = sm.OLS(y, sm.add_constant(pd.DataFrame(X[included]))).fit() 
            # use all coefs except intercept
            pvalues = model.pvalues.iloc[1:]
            worst_pval = pvalues.max() # null if pvalues is empty
            if worst_pval > PRemove:
                changed=True
                worst_feature = pvalues.idxmax()
                included.remove(worst_feature)
                if verbose:
                    print('Drop {:30} with p-value {:.6}'.format(worst_feature, worst_pval))
            if not changed:
                break
        if verbose:
            print(f"选择的特征：{included}")
            print(model.summary())
        return model
    """
    lm = py"stepwiselm"(
        X, y; initial_list=initial_list, PEnter=PEnter, PRemove=PRemove, verbose=verbose
    )
    return lm
end

function relieff(X, y; k=5)
    py"""
    from sklearn.metrics.pairwise import pairwise_distances
    import numpy as np

    def relieff(X, y, k=5):
        n_samples, n_features = X.shape

        # 计算样本的两两距离
        distance = pairwise_distances(X, metric='manhattan')

        score = np.zeros(n_features)

        for idx in range(n_samples):
            near_hit = []
            near_miss = dict()

            self_fea = X[idx, :]
            c = np.unique(y).tolist()

            stop_dict = dict()
            for label in c:
                stop_dict[label] = 0
            del c[c.index(y[idx])]

            p_dict = dict()
            p_label_idx = float(len(y[y == y[idx]]))/float(n_samples)

            for label in c:
                p_label_c = float(len(y[y == label]))/float(n_samples)
                p_dict[label] = p_label_c/(1-p_label_idx)
                near_miss[label] = []

            distance_sort = []
            distance[idx, idx] = np.max(distance[idx, :])

            for i in range(n_samples):
                distance_sort.append([distance[idx, i], int(i), y[i]])
            distance_sort.sort(key=lambda x: x[0])

            for i in range(n_samples):
                # find k nearest hit points
                if distance_sort[i][2] == y[idx]:
                    if len(near_hit) < k:
                        near_hit.append(distance_sort[i][1])
                    elif len(near_hit) == k:
                        stop_dict[y[idx]] = 1
                else:
                    # find k nearest miss points for each label
                    if len(near_miss[distance_sort[i][2]]) < k:
                        near_miss[distance_sort[i][2]].append(distance_sort[i][1])
                    else:
                        if len(near_miss[distance_sort[i][2]]) == k:
                            stop_dict[distance_sort[i][2]] = 1
                stop = True
                for (key, value) in stop_dict.items():
                        if value != 1:
                            stop = False
                if stop:
                    break

            # update reliefF score
            near_hit_term = np.zeros(n_features)
            for ele in near_hit:
                near_hit_term = np.array(abs(self_fea-X[ele, :])) + np.array(near_hit_term)

            near_miss_term = dict()
            for (label, miss_list) in near_miss.items():
                near_miss_term[label] = np.zeros(n_features)
                for ele in miss_list:
                    near_miss_term[label] = np.array(abs(self_fea-X[ele, :])) + np.array(near_miss_term[label])
                score += near_miss_term[label] / (k*p_dict[label])
            score -= near_hit_term / k
        score = score / np.sum(score)
        return list(np.argsort(-1*score, 0) + 1), list(score)  # np.argsort(-1*score, 0) + 1 倒序排列，并匹配 Julia 的索引
    """
    index, weights = py"relieff"(X, y; k=k)
    return index, weights
end

function fitlm(X::Array, y::Array)
    #创建多元线性回归模型
    sm = pyimport("statsmodels.api")
    mdl = sm.OLS(y, sm.add_constant(X)).fit()
    return mdl
end
