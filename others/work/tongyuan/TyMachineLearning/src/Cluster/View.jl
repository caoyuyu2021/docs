using PyCall
using TyPlot

#簇的可视化
function dendrogram(tree)
    X = tree
    py"""
    from scipy.cluster.hierarchy import dendrogram
    def Arr2List(X):
        if X.shape[1] == 1:
            return [list(X)[i][0] for i in range(X.shape[0])]
        elif X.shape[0] == 1:
            return [list(X)[0][j] for j in range(X.shape[1])]
        else:
            return X.tolist()
    def Dendrogram(X):
        X = Arr2List(X)
        return dendrogram(X)
    """
    py"Dendrogram"(X)
end

#层次聚类的最优叶子排序
function optimalleaforder(tree, D)
    X1 = tree
    X2 = D
    py"""
    from scipy.cluster import hierarchy
    def Optimalleaforder(X1, X2):
        y = hierarchy.leaves_list(hierarchy.optimal_leaf_ordering(X1, X2))
        return y
    """
    y = py"Optimalleaforder"(X1, X2)
    return [i + 1 for i in y]
end

function silhouette(dataset, n_clusters)
    py"""
    def Silhouette(dataset,n_clusters):
        from sklearn.cluster import KMeans
        from sklearn.metrics import silhouette_samples, silhouette_score
        import matplotlib.pyplot as plt
        import matplotlib.cm as cm
        import numpy as np
        import matplotlib as mpl

        clusterer = KMeans(n_clusters=n_clusters)
        cluster_labels = clusterer.fit_predict(dataset)
        sample_silhouette_values = silhouette_samples(dataset, cluster_labels)
        plt.xlim([-0.1, 1])
        plt.ylim([0, len(dataset) + (n_clusters + 1) * 10])
        y_lower = 10
        for i in range(n_clusters):
            ith_cluster_silhouette_values = sample_silhouette_values[cluster_labels == i]
            ith_cluster_silhouette_values.sort()
            size_cluster_i = ith_cluster_silhouette_values.shape[0]
            y_upper = y_lower + size_cluster_i
            color = cm.nipy_spectral(float(i) / n_clusters)
            plt.fill_betweenx(#########################################################fill_betweenx为向x轴填充颜色
                np.arange(y_lower, y_upper),
                0,
                ith_cluster_silhouette_values,#######################################################绘制轮廓图关键函数
                facecolor=color,
                edgecolor=color,
                alpha=0.7,
            )
            plt.text(-0.05, y_lower + 0.5 * size_cluster_i, str(i+1))
            y_lower = y_upper + 10  # 10 for the 0 samples
        plt.gca().set_yticklabels([])  # Clear the yaxis labels / ticks
        plt.xlabel('The silhouette coefficient values')	
        plt.ylabel('Cluster label')
        plt.title('The silhouette plot for the various clusters')
        plt.show()
    """
    py"Silhouette"(dataset, n_clusters)
end
