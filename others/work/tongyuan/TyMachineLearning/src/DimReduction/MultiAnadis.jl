using PyCall

#经典多维标度
# function cmdscale(X)
#     #X是二维数组
#     py"""
#     from sklearn.manifold import MDS
#     def Cmdscale(X):
#         embedding = MDS(n_components=2, dissimilarity="precomputed", random_state=1)
#         X_transformed = embedding.fit_transform(X)
#         return X_transformed
#     """
#     return py"Cmdscale"(X)
# end

#马氏距离
function mahal(X, Y)
    py"""
    import scipy
    from scipy import spatial
    def Mahal(X, Y):
        d2 = scipy.spatial.distance.cdist(X, Y, "mahalanobis", VI=None)
        return d2
    """
    return py"Mahal"(X, Y)
end

"""
    function fitMDS(;
        n_components=2, max_iter=50, n_init=4, random_state=nothing, normalized_stress=false
    ): 补充此版本模型库中没有的 MDS 模型

    args: 
        n_components(optional, default=2): 
        max_iter(optional, default=50): 计算迭代次数
        n_init(optional, default=4): 
        random_state(optional, default=nothing): 随机数种子
        normalized_stress(optional, default=false): 
    return:
        mds: A MDS embedding. 
        
"""
function cmdscale(
    X; n_components=2, max_iter=50, n_init=4, random_state=nothing, normalized_stress=false
)
    py"""
    import pandas as pd
    import numpy as np
    from sklearn import manifold

    def Dummyvar(X, n_components=2, max_iter=50, n_init=4, random_state=None):
        mds = manifold.MDS(
            n_components=n_components, 
            max_iter=max_iter, 
            n_init=n_init, 
            random_state=random_state, 
        )
        X_transformed = mds.fit_transform(X)
        return mds, X_transformed
    """
    return py"Dummyvar"(
        X;  # Julia return
        n_components=n_components,
        max_iter=max_iter,
        n_init=n_init,
        random_state=random_state,
    )
end
