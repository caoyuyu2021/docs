using PyCall

#线性模型的响应向量
function response(clf, Xnew)
    py"""
    def Predict(clf, Xnew):
        return clf.predict(Xnew)
    """
    return py"Predict"(clf, Xnew)
end

function fitglm(X, formula, falimy_clsa)
    y = names(X)
    X = Array(X)
    #拟合线性混合效应模型
    py"""
    import statsmodels.api as sm
    import pandas as pd
    import os
    import numpy as np
    def fitglm_my(X, y, formula, falimy_clsa):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        if falimy_clsa == "Poisson":
            model = sm.GLM.from_formula(formula, family=sm.families.Poisson(), data=data1)
        elif falimy_clsa == "Binomial":
            model = sm.GLM.from_formula(formula, family=sm.families.Binomial(), data=data1)
        elif falimy_clsa == "Gamma":
            model = sm.GLM.from_formula(formula, family=sm.families.Gamma(), data=data1)
        elif falimy_clsa == "Gaussian":
            model = sm.GLM.from_formula(formula, family=sm.families.Gaussian(), data=data1)
        elif falimy_clsa == "InverseGaussian":
            model = sm.GLM.from_formula(formula, family=sm.families.InverseGaussian(), data=data1)
        elif falimy_clsa == "NegativeBinomial":
            model = sm.GLM.from_formula(formula, family=sm.families.NegativeBinomial(), data=data1)
        mdf = model.fit()
        return mdf
    """
    return py"fitglm_my"(X, y, formula, falimy_clsa)
end

function get_irsdata()
    #获取鸢尾花数据
    py"""
    from sklearn.datasets import load_iris
    
    def Getdata ():
        X, y = load_iris(return_X_y=True)
        return X, y
    """
    return py"Getdata"()
end

function mnrfit(
    X,
    y;
    penalty="l2",
    dual=false,
    tol=0.0001,
    C=1.0,
    fit_intercept=true,
    intercept_scaling=1,
    class_weight=nothing,
    random_state=nothing,
    solver="lbfgs",
    max_iter=100,
    multi_class="auto",
    verbose=0,
    warm_start=false,
    n_jobs=nothing,
    l1_ratio=nothing,
)
    #多项逻辑回归
    py"""
    from sklearn.linear_model import LogisticRegression
    def Mnrfit (X, y, penalty, dual, tol, C, fit_intercept, intercept_scaling, class_weight, random_state, solver, max_iter, multi_class, verbose, warm_start, n_jobs, l1_ratio):
        lr = LogisticRegression(penalty=penalty, dual=dual, tol=tol, fit_intercept=fit_intercept, intercept_scaling=intercept_scaling, class_weight=class_weight, solver=solver, warm_start=warm_start,multi_class=multi_class, verbose=verbose, n_jobs=n_jobs, l1_ratio=l1_ratio, random_state=random_state,max_iter=max_iter)
        lr.fit(X, y)
        return lr
    """
    return py"Mnrfit"(
        X,
        y,
        penalty,
        dual,
        tol,
        C,
        fit_intercept,
        intercept_scaling,
        class_weight,
        random_state,
        solver,
        max_iter,
        multi_class,
        verbose,
        warm_start,
        n_jobs,
        l1_ratio,
    )
end

function mnrval(mdl, X, y)
    #多项逻辑回归值
    py"""
    from sklearn.linear_model import LogisticRegression
    from sklearn.linear_model import LogisticRegressionCV
    def Mnrval (mdl, X, y):
        soc = mdl.score(X, y)
        return soc
    """
    return py"Mnrval"(mdl, X, y)
end

function lassoglm(X, y; distr=0.0, alpha=0.1, fit_intercept=true, link="auto", max_iter=100)
    #创建广义线性回归模型
    py"""
    from sklearn import linear_model
    def fitglm_my(X, y, distr, alpha, fit_intercept, link, max_iter):
        clf = linear_model.TweedieRegressor(power=distr,
                alpha=alpha,
                fit_intercept=fit_intercept,
                link=link,
                max_iter=max_iter,)
        mdf = clf.fit(X, y)
        w = mdf.coef_
        return mdf, w
    """
    return py"fitglm_my"(X, y, distr, alpha, fit_intercept, link, max_iter)
end

function coeftest_glm(mdl, A)
    #线性回归模型的方差分析
    py"""
    import pandas as pd
    import numpy as np
    import statsmodels.api
    from statsmodels.formula.api import ols
    from statsmodels.stats.anova import anova_lm
    def CoefTest (mdl, A):
        f_test = mdl.f_test(A)
        return f_test
    """
    return py"CoefTest"(mdl, A)
end

function get_a(mdl)
    #获取rmaix
    py"""
    import numpy as np
    import statsmodels.api as sm
    import pandas as pd
    import os
    def Get_a (mdl):
        A = np.identity(len(mdl.params))
        C = A[1:,:]
        C = C.copy()
        return C
    """
    return py"Get_a"(mdl)
end

""" 
    stepwiseglm(X, y; initial_list=[], PEnter=0.01, PRemove=0.05, verbose=true): 使用逐步回归创建广义线性回归模型

    args: 
        X: 特征数据，指定为一个 row * col 的 Matrix，或一个 DataFrame
        y: 标签值，指定为一个 row * 1 的 Vector
        initial_list(optinal, default=[]): 初始的特征，包含了初始化模型训练时需要使用的特征的列名的 Vector（若 X 为 Matrix，则使用 ["X_1", "X_2", ..., "X_n"] 表示）
        PEnter(optinal, default=0.01): 添加特征的阈值
        PRemove(optinal, default=0.05): 去除特征的阈值
        verbose(optinal, default=true): 是否输出细节信息
    Returns: 
        model: 广义线性回归模型
"""
function stepwiseglm(X, y; initial_list=[], PEnter=0.01, PRemove=0.05, verbose=true)
    py"""
    import statsmodels.api as sm
    import pandas as pd

    def stepwiseglm(X, y, 
                    initial_list=[], 
                    PEnter=0.01, 
                    PRemove = 0.05, 
                    verbose=True):
        assert PEnter < PRemove, f'PEnter 必须小于 PRemove: (PEnter={PEnter}, PRemove={PRemove})'

        if not isinstance(X, pd.DataFrame): 
            X = pd.DataFrame(X, columns=['X_'+ str(i+1)  for i in range(X.shape[1])])

        included = list(initial_list)  # 算法初始就包含的特征，默认是空集
        model = None
        while True:
            changed=False
            # 前向选择过程
            excluded = list(set(X.columns)-set(included))  # 未包含的特征，默认是全集
            new_pval = pd.Series(index=excluded, dtype='float64')  # 用于记录新加入特征的 p value
            for new_column in excluded:  # 挨个儿把特征加入到模型中进行训练
                model = sm.GLM(y, sm.add_constant(pd.DataFrame(X[included+[new_column]]))).fit() 
                new_pval[new_column] = model.pvalues[new_column]  # 记录加入之后的 p value
            best_pval = new_pval.min()
            if best_pval < PEnter:  # 如果加入了某特征之后，p value 小于设定的阈值，就选择这一个特征
                best_feature = new_pval.idxmin()
                included.append(best_feature)
                changed=True
                if verbose:
                    print('Add  {:30} with p-value {:.6}'.format(best_feature, best_pval))

            # 反向选择过程 - 和正向相反
            model = sm.GLM(y, sm.add_constant(pd.DataFrame(X[included]))).fit()
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
    glm = py"stepwiseglm"(
        X, y; initial_list=initial_list, PEnter=PEnter, PRemove=PRemove, verbose=verbose
    )
    return glm
end

function fitglm(X::Array, y::Array; family_clsa="Gaussian")
    sm = pyimport("statsmodels.api")
    families = sm.families
    family = nothing

    if family_clsa == "Gaussian"
        family = families.Gaussian()
    elseif family_clsa == "Poisson"
        family = families.Poisson()
    elseif family_clsa == "Binomial"
        family = families.Binomial()
    elseif family_clsa == "Gamma"
        family = families.Gamma()
    elseif family_clsa == "InverseGaussian"
        family = families.InverseGaussian()
    elseif family_clsa == "NegativeBinomial"
        family = families.NegativeBinomial()
    else
        println(
            "family_clsa 的值必须为 \"Gaussian, Poisson, Binomial, Gamma, InverseGaussian, NegativeBinomial\" 中的一个，\"$(family_clsa)\" 不在其中，请检查拼写。（已设置为默认值: Gaussian）",
        )
        family = families.Gaussian()
    end

    mdl = sm.GLM(y, sm.add_constant(X); family=family).fit()
    return mdl
end
