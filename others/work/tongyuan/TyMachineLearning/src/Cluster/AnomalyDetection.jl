using PyCall
using CSV
using DataFrames
using TyMachineLearning

function iforest(X, contamination="auto")
    #拟合隔离林用于异常检测
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import IsolationForest
    def Dummyvar(X, contamination):
        clf = IsolationForest(contamination=contamination,random_state=0).fit(X)
        score = clf.score_samples(X)
        tf = clf.fit_predict(X)
        return clf, tf, score
    """
    return py"Dummyvar"(X, contamination)
end

function isanomaly(clf, X)
    #使用隔离林查找数据中的异常
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import IsolationForest
    def Dummyvar(clf, X):
        F = clf.predict(X)
        return F
    """
    return py"Dummyvar"(clf, X)
end

function lof(X, contamination="auto", novelty="False")
    #建立局部异常点因子模型进行异常检测
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.neighbors import LocalOutlierFactor
    def Dummyvar(X, contamination, novelty):
        if novelty == "True":
            clf = LocalOutlierFactor(contamination=contamination,novelty=True).fit(X)
            score = clf.score_samples(X)
            tf = clf.predict(X)
        elif novelty == "False":
            clf = LocalOutlierFactor(contamination=contamination,novelty=False).fit(X)
            score = clf.negative_outlier_factor_
            tf = clf.fit_predict(X)
        return clf, tf, score
    """
    return py"Dummyvar"(X, contamination, novelty)
end

function robustcov(X)
    #稳健的多元协方差和均值估计
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.covariance import EllipticEnvelope
    def Dummyvar(X):
        cov = EllipticEnvelope(random_state=0).fit(X)
        sig = cov.correct_covariance(X)
        mah = cov.mahalanobis(X)
        outliers = cov.predict(X)
        return cov, sig, mah, outliers
    """
    return py"Dummyvar"(X)
end

function get_robustcovdata()
    #提取数据
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.covariance import EllipticEnvelope
    def Dummyvar():
        true_cov = np.array([[.8, .3],
                      [.3, .4]])
        X = np.random.RandomState(0).multivariate_normal(mean=[0, 0],
                                                  cov=true_cov,
                                                 size=500)
        return X
    """
    return py"Dummyvar"()
end

function ocsvm(X, kernel="rbf")
    #拟合一类支持向量机模型进行异常检测
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.svm import OneClassSVM
    def Dummyvar(X, kernel):
        clf = OneClassSVM(kernel=kernel,gamma='auto').fit(X)
        score = clf.score_samples(X)
        tf = clf.fit_predict(X)
        return clf, tf, score
    """
    return py"Dummyvar"(X, kernel)
end
