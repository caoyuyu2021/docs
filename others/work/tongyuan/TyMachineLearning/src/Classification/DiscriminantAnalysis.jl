using PyCall
# using MLJBase
# using MLJScikitLearnInterface

# #拟合判别分析分类器
# function fitcdiscr(X, y)
#     X = MLJBase.table(Array(X))
#     y = MLJBase.categorical(Array(y))
#     model = MLJScikitLearnInterface.BayesianLDA()
#     f, _, _ = MLJBase.fit(model, 1, X, y)
#     return MLJBase.fitted_params(model, f), f
# end

function fitcdiscr(X, y, n_components=2, solver="svd")
    #拟合判别分析分类器
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
    def Dummyvar(X, y, n_components, solver):
        clf = LinearDiscriminantAnalysis(n_components=n_components, solver=solver)
        clf.fit(X, y)
        return clf
    """
    return py"Dummyvar"(X, y, n_components, solver)
end
