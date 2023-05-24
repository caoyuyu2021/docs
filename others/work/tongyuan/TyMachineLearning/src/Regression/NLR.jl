using PyCall

function nlinfit(X, falimy_clsa)
    y = names(X)
    X = Array(X)
    #创建非线性回归模型
    py"""
    from sklearn.neighbors import KNeighborsRegressor, RadiusNeighborsRegressor
    from sklearn.ensemble import GradientBoostingRegressor, AdaBoostRegressor,\
        RandomForestRegressor, BaggingRegressor, ExtraTreesRegressor, VotingRegressor
    from sklearn.tree import DecisionTreeRegressor, ExtraTreeRegressor
    from sklearn.svm import SVR
    from sklearn.neural_network import MLPRegressor
    from sklearn.gaussian_process import GaussianProcessRegressor
    from sklearn.linear_model import LinearRegression, RANSACRegressor, ARDRegression, HuberRegressor, TheilSenRegressor,\
        SGDRegressor, PassiveAggressiveRegressor, Lasso, ElasticNet, Ridge, BayesianRidge, Lars
    import pandas as pd
    import numpy as np
    def Nlinfit_my(X, y, falimy_clsa):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        y1 = data1.iloc[:,-1]
        y2 = y1.values
        if falimy_clsa == "KNeighborsRegressor":
            model = KNeighborsRegressor()
        elif falimy_clsa == "RadiusNeighborsRegressor":
            model = RadiusNeighborsRegressor()
        elif falimy_clsa == "GradientBoostingRegressor":
            model = GradientBoostingRegressor()
        elif falimy_clsa == "AdaBoostRegressor":
            model = AdaBoostRegressor()
        elif falimy_clsa == "RandomForestRegressor":
            model = RandomForestRegressor()
        elif falimy_clsa == "BaggingRegressor":
            model = BaggingRegressor()
        elif falimy_clsa == "ExtraTreesRegressor":
            model = ExtraTreesRegressor()
        elif falimy_clsa == "DecisionTreeRegressor":
            model = DecisionTreeRegressor()
        elif falimy_clsa == "ExtraTreeRegressor":
            model = ExtraTreeRegressor()
        elif falimy_clsa == "SVR":
            model = SVR()
        elif falimy_clsa == "MLPRegressor":
            model = MLPRegressor()
        elif falimy_clsa == "GaussianProcessRegressor":
            model = GaussianProcessRegressor()
        elif falimy_clsa == "LinearRegression":
            model = LinearRegression()
        elif falimy_clsa == "RANSACRegressor":
            model = RANSACRegressor()
        elif falimy_clsa == "ARDRegression":
            model = ARDRegression()
        elif falimy_clsa == "HuberRegressor":
            model = HuberRegressor()
        elif falimy_clsa == "TheilSenRegressor":
            model = TheilSenRegressor()
        elif falimy_clsa == "SGDRegressor":
            model = SGDRegressor()
        elif falimy_clsa == "PassiveAggressiveRegressor":
            model = PassiveAggressiveRegressor()
        elif falimy_clsa == "Lasso":
            model = Lasso()
        elif falimy_clsa == "ElasticNet":
            model = ElasticNet()
        elif falimy_clsa == "Ridge":
            model = Ridge()
        elif falimy_clsa == "BayesianRidge":
            model = BayesianRidge()
        elif falimy_clsa == "Lars":
            model = Lars()
        mdf = model.fit(x1, y2.ravel())
        return mdf
    """
    return py"Nlinfit_my"(X, y, falimy_clsa)
end

function get_nlindata()
    py"""
    def Get_nlindata():
        y = [.27, .16, .06, .036, .044, .04, .022, .017, .022, .014, .017, .02, .019, .017, .011, .01, .03, .05, .066, .09]
        ly, n = len(y), 100
        x = [[i / ly]for i in range(ly)]
        # 待测集
        w = [[i / n] for i in range(n)]
        return x, y, w
    """
    return py"Get_nlindata"()
end

function dummyvar(data)
    #创建虚拟变量
    py"""
    import setuptools
    import pandas as pd
    
    def Dummyvar(data):
        df_data = pd.DataFrame(data)
        d_data = pd.get_dummies(df_data)
        return d_data
    """
    return py"Dummyvar"(data)
end

function predict_nl(mdl, X_test)
    #非线性回归预测响应
    py"""
    def Predict(mdl, X_test):
        y_val = mdl.predict(X_test)
        return y_val
    """
    return py"Predict"(mdl, X_test)
end

function feval_nl(mdl, X_test)
    #非线性回归预测响应
    py"""
    def Predict(mdl, X_test):
        y_val = mdl.predict(X_test)
        return y_val
    """
    return py"Predict"(mdl, X_test)
end

function nlpredci(mdl, X, alpha, n_splits)
    #非线性回归置信区间
    y = names(X)
    X = Array(X)
    py"""
    from scipy import stats
    import pandas as pd
    import numpy as np
    from sklearn.model_selection import KFold
    def Predict(mdl, X, y, alpha, n_splits):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x = data1.iloc[:,:-1]
        y = data1.iloc[:,-1]
        kf = KFold(n_splits=10)
        coes = []
        X1 = X
        y1 = y
        for train_index, test_index in kf.split(X1,y1):
            mdl.fit(np.array(X)[train_index], np.array(y)[train_index])
            coes.append(mdl.coef_) 
        data1 = []
        res = []
        for i in range(len(coes[0])):
            for j in range(10):
                data1.append(coes[j][i])
            data2 = np.array(data1)
            ci = stats.t.interval(alpha, df=len(data2)-1,loc=np.mean(data2),scale=stats.sem(data2))
            res.append(ci)
        return res
    """
    return py"Predict"(mdl, X, y, alpha, n_splits)
end

function get_nlmodel(X, falimy_clsa)
    y = names(X)
    X = Array(X)
    #创建非线性回归模型
    py"""
    from sklearn.neighbors import KNeighborsRegressor, RadiusNeighborsRegressor
    from sklearn.ensemble import GradientBoostingRegressor, AdaBoostRegressor,\
        RandomForestRegressor, BaggingRegressor, ExtraTreesRegressor, VotingRegressor
    from sklearn.tree import DecisionTreeRegressor, ExtraTreeRegressor
    from sklearn.svm import SVR
    from sklearn.neural_network import MLPRegressor
    from sklearn.gaussian_process import GaussianProcessRegressor
    from sklearn.linear_model import LinearRegression, RANSACRegressor, ARDRegression, HuberRegressor, TheilSenRegressor,\
        SGDRegressor, PassiveAggressiveRegressor, Lasso, ElasticNet, Ridge, BayesianRidge, Lars
    import pandas as pd
    import numpy as np
    def Nlinfit_my(X, y, falimy_clsa):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        x = x1.copy()
        y1 = data1.iloc[:,-1]
        y = y1.copy
        if falimy_clsa == "KNeighborsRegressor":
            model = KNeighborsRegressor()
        elif falimy_clsa == "RadiusNeighborsRegressor":
            model = RadiusNeighborsRegressor()
        elif falimy_clsa == "GradientBoostingRegressor":
            model = GradientBoostingRegressor()
        elif falimy_clsa == "AdaBoostRegressor":
            model = AdaBoostRegressor()
        elif falimy_clsa == "RandomForestRegressor":
            model = RandomForestRegressor()
        elif falimy_clsa == "BaggingRegressor":
            model = BaggingRegressor()
        elif falimy_clsa == "ExtraTreesRegressor":
            model = ExtraTreesRegressor()
        elif falimy_clsa == "DecisionTreeRegressor":
            model = DecisionTreeRegressor()
        elif falimy_clsa == "ExtraTreeRegressor":
            model = ExtraTreeRegressor()
        elif falimy_clsa == "SVR":
            model = SVR()
        elif falimy_clsa == "MLPRegressor":
            model = MLPRegressor()
        elif falimy_clsa == "GaussianProcessRegressor":
            model = GaussianProcessRegressor()
        elif falimy_clsa == "LinearRegression":
            model = LinearRegression()
        elif falimy_clsa == "RANSACRegressor":
            model = RANSACRegressor()
        elif falimy_clsa == "ARDRegression":
            model = ARDRegression()
        elif falimy_clsa == "HuberRegressor":
            model = HuberRegressor()
        elif falimy_clsa == "TheilSenRegressor":
            model = TheilSenRegressor()
        elif falimy_clsa == "SGDRegressor":
            model = SGDRegressor()
        elif falimy_clsa == "PassiveAggressiveRegressor":
            model = PassiveAggressiveRegressor()
        elif falimy_clsa == "Lasso":
            model = Lasso()
        elif falimy_clsa == "ElasticNet":
            model = ElasticNet()
        elif falimy_clsa == "Ridge":
            model = Ridge()
        elif falimy_clsa == "BayesianRidge":
            model = BayesianRidge()
        elif falimy_clsa == "Lars":
            model = Lars()
        return model, x, y
    """
    return py"Nlinfit_my"(X, y, falimy_clsa)
end
