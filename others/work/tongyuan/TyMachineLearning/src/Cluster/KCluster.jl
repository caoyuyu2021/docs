using Clustering
using Distances
using PyCall

#k均值聚类
# function kmeans(X, k)
#     X = Array(X)'
#     res = Clustering.kmeans(X, k)
#     return res.centers, res.assignments
# end

function kmeans(
    X;
    n_clusters=8,
    init="k-means++",
    n_init=10,
    max_iter=300,
    tol=0.0001,
    verbose=0,
    copy_x=true,
    algorithm="auto",
)
    py"""
    from sklearn.cluster import KMeans
    def my_val(X, n_clusters, init, n_init, algorithm, max_iter, tol, verbose, copy_x):
        clustering = KMeans(n_clusters=n_clusters, init=init, n_init=n_init, algorithm=algorithm, max_iter=max_iter, tol=tol,verbose=verbose,copy_x=copy_x).fit(X)
        return clustering
    """
    py"my_val"(X, n_clusters, init, n_init, algorithm, max_iter, tol, verbose, copy_x)
end

#k中心点聚类
function kmedoids(X, k)
    X = Array(X)
    dist = pairwise(SqEuclidean(), X'; dims=length(size(X)))
    res = Clustering.kmedoids(dist, k)
    return res.assignments
end

#马氏距离
# function mahal(Y, X)
#     py"""
#     import numpy as np

#     def mahal(Y, X):
#         rx,cx = np.array(X).shape
#         ry,cy = np.array(Y).shape
#         if cx != cy:
#             print("stats:mahal:InputSizeMismatch")
#         if rx < cx:
#             print("stats:mahal:TooFewRows")
#         if (np.imag(X)).any() | (np.imag(Y)).any():
#             print("stats:mahal:NoComplex") 
#         m = np.mean(X, axis=0)
#         M = np.tile(m,(ry,1))
#         C = X - np.tile(m,(rx,1))
#         Q,R = np.linalg.qr(C) 
#         ri = np.linalg.solve(R.T, (Y-M).T)
#         d = ((np.sum(ri*ri, axis=0)).T)*(rx-1)
#         return d
#     """
#     py"mahal"(Y, X)
# end
