# using MLJBase
# using MLJScikitLearnInterface
using CSV
using DataFrames
using PyCall

#从联系构建集聚集群
# function cluster(X, n)
#     model = MLJScikitLearnInterface.AgglomerativeClustering(; n_clusters=n)
#     f, = MLJBase.fit(model, 1, X)
#     fp = MLJBase.fitted_params(model, f)
#     return fp
# end

function cluster(X, n_clusters=2, linkage="ward")
    #谱聚类
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.cluster import AgglomerativeClustering
    def Dummyvar(X, n_clusters, linkage):
        clustering = AgglomerativeClustering(n_clusters=n_clusters, linkage=linkage)
        clf = clustering.fit(X)
        idx = clf.fit_predict(X)
        return clf, idx
    """
    return py"Dummyvar"(X, n_clusters, linkage)
end

#从数据构造聚集簇
function clusterdata(X, cutoff)
    X = Array(X)
    py"""
    from scipy.cluster.hierarchy import fclusterdata
    #将数组转为列表
    def Arr2List(X):
        if X.shape[1] == 1:
            return [list(X)[i][0] for i in range(X.shape[0])]
        elif X.shape[0] == 1:
            return [list(X)[0][j] for j in range(X.shape[1])]
        else:
            return X.tolist()
    #构造聚集簇
    def fc(X, ctuoff):
        X = Arr2List(X)
        return fclusterdata(X,ctuoff)
    """
    py"fc"(X, cutoff)
end

#凝聚层次聚类树
function linkage(X, method)
    X = Array(X)
    py"""
    from scipy.cluster.hierarchy import linkage

    def Arr2List(X):
        if X.shape[1] == 1:
            return [list(X)[i][0] for i in range(X.shape[0])]
        elif X.shape[0] == 1:
            return [list(X)[0][j] for j in range(X.shape[1])]
        else:
            return X.tolist()
    def fc(X, method):
        X = Arr2List(X)
        return linkage(X, method)
    """
    py"fc"(X, method)
end

#成对观测值之间的两两距离
function pdist(X)
    X = Array(X)
    py"""
    from scipy.spatial.distance import pdist
    def Arr2List(X):
        if X.shape[1] == 1:
            return [list(X)[i][0] for i in range(X.shape[0])]
        elif X.shape[0] == 1:
            return [list(X)[0][j] for j in range(X.shape[1])]
        else:
            return X.tolist()
    def Pdist(X):
        X = Arr2List(X)
        return pdist(X)
    """
    py"Pdist"(X)
end

#共相关系数
function cophenet(Z, X)
    Z = Array(Z)
    X = Array(X)
    py"""
    from scipy.cluster.hierarchy import cophenet
    from scipy.spatial.distance import pdist
    def Arr2List(X):
        if X.shape[1] == 1:
            return [list(X)[i][0] for i in range(X.shape[0])]
        elif X.shape[0] == 1:
            return [list(X)[0][j] for j in range(X.shape[1])]
        else:
            return X.tolist()
    def Cophenet(Z,X):
        X = Arr2List(X)
        Z = Arr2List(Z)
        X = pdist(X)
        p,res = cophenet(Z,X)
        return p,res
    """
    py"Cophenet"(Z, X)
end

#不一致系数
function inconsistent(Z)
    Z = Array(Z)
    py"""
    from scipy.cluster.hierarchy import inconsistent
    def Arr2List(X):
        if X.shape[1] == 1:
            return [list(X)[i][0] for i in range(X.shape[0])]
        elif X.shape[0] == 1:
            return [list(X)[0][j] for j in range(X.shape[1])]
        else:
            return X.tolist()
    def Inconsistent(Z):
        Z = Arr2List(Z)
        return inconsistent(Z)
    """
    py"Inconsistent"(Z)
end

#格式化距离矩阵
function squareform(yIn)
    X = Array(yIn)
    py"""
    from scipy.spatial.distance import squareform
    def Squareform(X):
        return squareform(X)
    """
    py"Squareform"(X)
end
