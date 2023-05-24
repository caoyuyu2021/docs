using PyCall

#拟合k近邻分类器
# function fitcknn(X, y)
#     X = MLJBase.table(Array(X))
#     y = MLJBase.categorical(Array(y))
#     model = KNNClassifier()
#     f, _, _ = MLJBase.fit(model, 1, X, y)
#     return f
# end

function fitcknn(
    X,
    y;
    n_neighbors=5,
    weights="uniform",
    algorithm="auto",
    leaf_size=30,
    p=2,
    metric="minkowski",
)
    #拟合k近邻分类器
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.neighbors import KNeighborsClassifier
    def Dummyvar(X, y, n_neighbors, weights, algorithm, leaf_size, p, metric):
        clf = KNeighborsClassifier(n_neighbors=n_neighbors, weights=weights, algorithm=algorithm,leaf_size=leaf_size,p=p,metric=metric)
        clf.fit(X, y)
        return clf
    """
    return py"Dummyvar"(X, y, n_neighbors, weights, algorithm, leaf_size, p, metric)
end

#两组观测值之间的成对距离
function pdist2(X, Y, Distance)
    """
    Distance参数：
    'braycurtis', 'canberra', 'chebyshev', 'cityblock', 'correlation',
    'cosine', 'dice', 'euclidean', 'hamming', 'jaccard', 'jensenshannon',
    'kulsinski', 'mahalanobis', 'matching', 'minkowski', 'rogerstanimoto',
    'russellrao', 'seuclidean', 'sokalmichener', 'sokalsneath',
    'sqeuclidean', 'wminkowski', 'yule'
    """
    X = Array(X)
    Y = Array(Y)
    py"""
    from scipy.spatial.distance import cdist
    def Pdist2(X, Y, Distance):
        pdist2 = cdist(X, Y, Distance)
        return pdist2
    """
    py"Pdist2"(X, Y, Distance)
end

#创建Kd树最近邻搜索器
# function KDTreeSearcher(X)
#     X = Array(X)
#     py"""
#     from sklearn.neighbors import KDTree
#     def KDTreeSearcher(X):
#         clf = KDTree(X)
#         return clf
#     """
#     py"KDTreeSearcher"(X)
# end

# function KDTreeSearcher(X; leaf_size=40, metric="minkowski")
#     X = Array(X)
#     py"""
#     from sklearn.neighbors import KDTree
#     def KDTreeSearcher(X, leaf_size, metric):
#         clf = KDTree(X, leaf_size=leaf_size, metric=metric)
#         return clf
#     """
#     py"KDTreeSearcher"(X, leaf_size, metric)
# end
