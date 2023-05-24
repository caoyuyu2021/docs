# using Clustering
# using Distances

#基于密度的含噪数据空间聚类
# function dbscan(X, epsilon, minpts)
#     X = Array(X)
#     dist = pairwise(SqEuclidean(), X'; dims=length(size(X)))
#     clu = Clustering.dbscan(dist, epsilon, minpts)
#     return clu.assignments
# end

function dbscan(
    X; eps=0.5, min_samples=5, metric="euclidean", algorithm="auto", leaf_size=30, p=nothing
)
    py"""
    from sklearn.cluster import DBSCAN
    def my_val(X, eps, min_samples, metric, algorithm, leaf_size, p):
        clustering = DBSCAN(eps=eps, min_samples=min_samples, metric=metric, algorithm=algorithm, leaf_size=leaf_size, p=p).fit(X)
        return clustering
    """
    py"my_val"(X, eps, min_samples, metric, algorithm, leaf_size, p)
end
