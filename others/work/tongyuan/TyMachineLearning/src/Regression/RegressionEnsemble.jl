using PyCall

function oobloss(mdl, X, y)
    #袋外损失
    py"""
    from sklearn.metrics import mean_squared_error
    def Loss_rgp (mdl, X, y):
        y_val = mdl.predict(X)
        ls = mean_squared_error(y, y_val)
        return ls
    """
    return py"Loss_rgp"(mdl, X, y)
end

function AdaBoostrTree(X, n_estimators, learn_rate, max_depth=9, min_samples_leaf=1)
    #AdaBoostTree回归模型
    y = names(X)
    X = Array(X)
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import AdaBoostRegressor
    from sklearn.tree import DecisionTreeRegressor
    def Dummyvar(X, y, n_estimators, learn_rate,max_depth,min_samples_leaf):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        y1 = data1.iloc[:,-1]
        y2 = y1.values
        rng = np.random.RandomState(1)
        tree_m = DecisionTreeRegressor(max_depth=max_depth, min_samples_leaf=min_samples_leaf)
        ada_discrete = AdaBoostRegressor(
                        estimator=tree_m,
                        learning_rate=learn_rate,
                        n_estimators=n_estimators,
                        random_state=rng,
                    )
        clf = ada_discrete.fit(x1.values, y2.astype('int'))
        return clf
    """
    return py"Dummyvar"(X, y, n_estimators, learn_rate, max_depth, min_samples_leaf)
end

function fitrensemble(
    X,
    method="AdaBoost",
    n_estimators=10,
    learners="Tree",
    learn_rate=1.0,
    max_depth=9,
    min_samples_leaf=1,
)
    if method == "AdaBoost"
        model = AdaBoostrTree(X, n_estimators, learn_rate, max_depth, min_samples_leaf)
    elseif method == "Bag"
        if learners == "SVR"
            model = SVRbagger(X, n_estimators)
        elseif learners == "Tree"
            model = TreeBagger(X, n_estimators, max_depth)
        end
    end
    return model
end

function SVRbagger(X, n_estimators)
    #支持向量机回归模型
    y = names(X)
    X = Array(X)
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import BaggingRegressor
    from sklearn.svm import SVR
    def Dummyvar(X, y, n_estimators):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        y1 = data1.iloc[:,-1]
        y2 = y1.values
        bagging = BaggingRegressor(estimator=SVR(),n_estimators=n_estimators,
                             random_state=0)
        clf = bagging.fit(x1.values, y2.astype('int'))
        return clf
    """
    return py"Dummyvar"(X, y, n_estimators)
end

function dropna(X)
    #去除na值
    y = names(X)
    X = Array(X)
    py"""
    import pandas as pd
    import numpy as np
    def Dummyvar(X, y):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        y1 = data1.iloc[:,-1]
        y2 = y1.values
        return x1.values, y2.astype('int')
    """
    return py"Dummyvar"(X, y)
end

function TreeBagger(X, n_estimators, depth)
    #回归树模型
    y = names(X)
    X = Array(X)
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import BaggingRegressor
    from sklearn.tree import DecisionTreeRegressor
    def Dummyvar(X, y, n_estimators, depth):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        y1 = data1.iloc[:,-1]
        y2 = y1.values
        tree_m = DecisionTreeRegressor(max_depth=depth)
        bagging = BaggingRegressor(tree_m,n_estimators=n_estimators,
                             random_state=0)
        clf = bagging.fit(x1.values, y2.astype('int'))
        return clf
    """
    return py"Dummyvar"(X, y, n_estimators, depth)
end

function randomL(mdl, x_new)
    #线性回归模式下随机噪声响应的模拟
    y = TyMachineLearning.predict(mdl, x_new)
    y = y.values
    py"""
    import pandas as pd
    import numpy as np
    def Dummyvar(mdl, x_new, y):
        error1=1.0
        y_noise1 = error1 * np.random.normal(size=y.size)
        ydata1 = y + y_noise1
        return ydata1
    """
    return py"Dummyvar"(mdl, x_new, y)
end

function ty_make_regression(;
    n_samples=1000, n_features=4, n_informative=2, random_state=0, shuffle="False"
)
    #获取分类数据
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.datasets import make_regression
    def Dummyvar(n_samples, n_features, n_informative,random_state,shuffle):
        if shuffle == "False":
            X, y = make_regression(n_samples=n_samples, n_features=n_features,
                            n_informative=n_informative,
                            random_state=random_state, shuffle=False)
        elif shuffle == "True":
            X, y = make_regression(n_samples=n_samples, n_features=n_features,
                            n_informative=n_informative,
                            random_state=random_state, shuffle=True)
        return X, y
    """
    return py"Dummyvar"(n_samples, n_features, n_informative, random_state, shuffle)
end

function randomrforest(
    X,
    y;
    max_depth=5,
    n_estimators=100,
    criterion="squared_error",
    min_samples_split=2,
    min_samples_leaf=1,
    min_weight_fraction_leaf=0.0,
    max_features=1.0,
)
    #随机森林
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import RandomForestRegressor
    def Dummyvar(X, y, max_depth, n_estimators, criterion, min_samples_split, min_samples_leaf,min_weight_fraction_leaf,max_features):
        clf = RandomForestRegressor(max_depth=max_depth, random_state=0,n_estimators=n_estimators,
                criterion=criterion,
                min_samples_split=min_samples_split,
                min_samples_leaf=min_samples_leaf,
                min_weight_fraction_leaf=min_weight_fraction_leaf,
                max_features=max_features)
        clf.fit(X, y)
        return clf
    """
    return py"Dummyvar"(
        X,
        y,
        max_depth,
        n_estimators,
        criterion,
        min_samples_split,
        min_samples_leaf,
        min_weight_fraction_leaf,
        max_features,
    )
end

function GradientrBoosting(
    X,
    y;
    max_depth=3,
    n_estimators=100,
    loss="squared_error",
    learning_rate=0.1,
    subsample=1.0,
    criterion="friedman_mse",
    min_samples_split=2,
    min_samples_leaf=1,
    min_weight_fraction_leaf=0.0,
    min_impurity_decrease=0.0,
    alpha=0.9,
)
    #随机森林
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import GradientBoostingRegressor
    def Dummyvar(X, y, max_depth, n_estimators, loss, learning_rate, subsample, criterion, min_samples_split, min_samples_leaf,min_weight_fraction_leaf,min_impurity_decrease,alpha):
        clf = GradientBoostingRegressor(max_depth=max_depth, random_state=0,n_estimators=n_estimators,
                loss=loss,
                learning_rate=learning_rate,
                subsample=subsample,
                criterion=criterion,
                min_samples_split=min_samples_split,
                min_samples_leaf=min_samples_leaf,
                min_weight_fraction_leaf=min_weight_fraction_leaf,)
        clf.fit(X, y)
        return clf
    """
    return py"Dummyvar"(
        X,
        y,
        max_depth,
        n_estimators,
        loss,
        learning_rate,
        subsample,
        criterion,
        min_samples_split,
        min_samples_leaf,
        min_weight_fraction_leaf,
        min_impurity_decrease,
        alpha,
    )
end

function HistrGradientBoosting(
    X,
    y;
    max_iter=100,
    loss="squared_error",
    learning_rate=0.1,
    max_leaf_nodes=31,
    min_samples_leaf=20,
    l2_regularization=0,
    max_bins=255,
)
    #随机森林
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import HistGradientBoostingRegressor
    def Dummyvar(X, y, max_iter, loss, learning_rate, max_leaf_nodes, min_samples_leaf,l2_regularization,max_bins):
        clf = HistGradientBoostingRegressor(max_iter=max_iter, random_state=0,
                loss=loss,
                learning_rate=learning_rate,
                max_leaf_nodes=max_leaf_nodes,
                min_samples_leaf=min_samples_leaf,
                l2_regularization=l2_regularization,
                max_bins=max_bins)
        clf.fit(X, y)
        return clf
    """
    return py"Dummyvar"(
        X,
        y,
        max_iter,
        loss,
        learning_rate,
        max_leaf_nodes,
        min_samples_leaf,
        l2_regularization,
        max_bins,
    )
end

function get_diabetes()
    #获取糖尿病数据集
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.datasets import load_diabetes
    def Dummyvar():
        X, y = load_diabetes(return_X_y=True)
        return X, y
    """
    return py"Dummyvar"()
end

function VotingRegressor(X, y, estimators)
    #集成预测
    py"""
    from sklearn.ensemble import VotingRegressor
    def Dummyvar(X, y, estimators):
        eclf = VotingRegressor(estimators=estimators)
        eclf.fit(X, y)               
        return eclf
    """
    return py"Dummyvar"(X, y, estimators)
end