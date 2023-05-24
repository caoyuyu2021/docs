using PyCall

#巴特利特试验
function barttest(args...)
    #args是数量大于1的一维数组
    py"""
    from scipy.stats import bartlett
    def Barttest(*args):
        stat, p = bartlett(*args)
        return stat, p
    """
    return py"Barttest"(args...)
end

#主成分分析
function pca(X)
    #主成分分析
    py"""
    from sklearn.decomposition import PCA
    import pandas as pd
    import numpy as np
    import sys 
    def pca_my(X):
        pca =PCA()
        lm = pca.fit(X)
        coeff = lm.components_
        explainedvar = lm.explained_variance_ratio_
        return coeff, explainedvar, pca
    """
    return py"pca_my"(X)
end
