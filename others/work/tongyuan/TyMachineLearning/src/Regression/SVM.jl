using PyCall

function fitrsvm(X, y, c=1.0, kernel="linear")
    #用随机特征展开拟合高斯核分类模型
    py"""
    import numpy as np
    import pandas as pd
    from sklearn import datasets, svm
    def Fitckernel(X, y, c, kernel):
        X = pd.DataFrame(X)
        y = pd.DataFrame(y)
        clf = svm.SVC(C=c, kernel=kernel)
        y1 = y.values
        clf.fit(X, y1.ravel())
        return clf, X, y
    """
    return py"Fitckernel"(X, y, c, kernel)
end

function crossval(clf, X, y, cv, scorels)
    #交叉验证支持向量机回归模型
    py"""
    from sklearn.model_selection import cross_val_score
    import numpy as np
    def Crossval (clf, X, y, cv, scorels):
        y = y.ravel()
        scores = cross_val_score(clf, X, y, cv=cv, scoring=scorels)
        return scores
    """
    return py"Crossval"(clf, X, y, cv, scorels)
end

function fitrkernel(X, y; kernel="rbf")
    py"""
    from sklearn.svm import SVR
    import pandas as pd
    def Fitrkernel(X, y, kernel):
        #训练模型
        clf = SVR(kernel=kernel).fit(X, y)
        return clf 
    """
    return py"Fitrkernel"(X, y, kernel)
end
