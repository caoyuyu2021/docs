# using NearestNeighbors

#创建Kd树最近邻搜索器
# function KDTreeSearcher(X::Matrix{Float64})
#     kdtree = KDTree(X)
#     return kdtree
# end

function KDTreeSearcher(X; leaf_size=40, metric="minkowski")
    X = Array(X)
    py"""
    from sklearn.neighbors import KDTree
    def KDTreeSearcher(X, leaf_size, metric):
        clf = KDTree(X, leaf_size=leaf_size, metric=metric)
        return clf
    """
    py"KDTreeSearcher"(X, leaf_size, metric)
end

#查找k最近邻
# function knnsearch(X, Y)
#     if typeof(X) <: NearestNeighbors.KDTree
#         Y = Matrix(Matrix{Float64}(Y)')
#         indices, distances = nn(X, Y)
#         return indices
#     else
#         X = Matrix(Matrix{Float64}(X)')
#         Y = Matrix(Matrix{Float64}(Y)')
#         kdtree = KDTree(X)
#         indices, distances = nn(kdtree, Y)
#         return indices
#     end
# end

#使用搜寻器对象查找指定距离内的所有邻居
# function rangesearch(Mdl, Y, r)
#     Y = Matrix(Y')
#     return inrange(Mdl, Y, r)
# end

function ExhaustiveSearcher(
    X; n_neighbors=5, radius=1.0, algorithm="auto", leaf_size=30, p=2, metric="minkowski"
)
    #拟合k近邻搜索器
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.neighbors import NearestNeighbors
    def Dummyvar(X, n_neighbors, radius, algorithm, leaf_size, p, metric):
        nn = NearestNeighbors(n_neighbors=n_neighbors, radius=radius, algorithm=algorithm,leaf_size=leaf_size,p=p,metric=metric)
        nn.fit(X)
        return nn
    """
    return py"Dummyvar"(X, n_neighbors, radius, algorithm, leaf_size, p, metric)
end

function knnsearch(mdl, Y; n_neighbors=nothing)
    #拟合k近邻分类器
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.neighbors import NearestNeighbors
    def Dummyvar(mdl, Y, n_neighbors):
        distances, indices = mdl.kneighbors(Y, n_neighbors=n_neighbors)
        return distances, indices
    """
    return py"Dummyvar"(mdl, Y, n_neighbors)
end

function rangesearch(mdl, Y; radius=nothing)
    #拟合k近邻分类器
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.neighbors import NearestNeighbors
    def Dummyvar(mdl, Y, radius):
        RNG = mdl.radius_neighbors(Y, radius=radius)
        distances = np.asarray(RNG[0][0])
        indices = np.asarray(RNG[1][0])
        return distances, indices
    """
    return py"Dummyvar"(mdl, Y, radius)
end

function createns(
    X;
    NSMethod="exhaustive",
    n_neighbors=5,
    radius=1.0,
    algorithm="auto",
    leaf_size=30,
    p=2,
    metric="minkowski",
)
    #创建最近邻搜索对象
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.neighbors import NearestNeighbors
    from sklearn.neighbors import KDTree
    def Dummyvar(X, NSMethod, n_neighbors, radius, algorithm, leaf_size, p, metric):
        if NSMethod == "exhaustive":
            clf = NearestNeighbors(n_neighbors=n_neighbors, radius=radius, algorithm=algorithm,leaf_size=leaf_size,p=p,metric=metric)
        elif NSMethod == "kdtree":
            clf = KDTree(X, leaf_size=leaf_size, metric=metric)
        clf.fit(X)
        return clf
    """
    return py"Dummyvar"(X, NSMethod, n_neighbors, radius, algorithm, leaf_size, p, metric)
end
