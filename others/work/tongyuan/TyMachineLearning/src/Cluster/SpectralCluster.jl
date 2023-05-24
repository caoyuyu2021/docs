# using MLJBase
# using MLJScikitLearnInterface

# #谱聚类
# function spectralcluster(X, k)
#     X = Array(X)
#     model = MLJScikitLearnInterface.SpectralClustering(;
#         n_clusters=k, assign_labels="discretize"
#     )
#     f, = MLJBase.fit(model, 1, X)
#     fp = MLJBase.fitted_params(model, f)
#     return fp[1]
# end
using PyCall
function spectralcluster(X, n_clusters; affinity="rbf", assign_labels="kmeans")
    #谱聚类
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.cluster import SpectralClustering
    import os
    os.environ["OMP_NUM_THREADS"] = '1'
    def Dummyvar(X, n_clusters, affinity, assign_labels):
        clustering = SpectralClustering(n_clusters=n_clusters,affinity=affinity,assign_labels=assign_labels,random_state=0)
        clf = clustering.fit(X)
        idx = clf.fit_predict(X)
        return clf, idx
    """
    return py"Dummyvar"(X, n_clusters, affinity, assign_labels)
end
