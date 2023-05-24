using PyCall
using CSV
using DataFrames
using TyMachineLearning

function get_digits()
    #获取手写数字数据
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.datasets import load_digits
    def Dummyvar():
        X, _ = load_digits(return_X_y=True)
        return X
    """
    return py"Dummyvar"()
end

function fitIsomap(X; n_components=2)
    #等距映射
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.manifold import Isomap
    def Dummyvar(X, n_components):
        embedding = Isomap(n_components=n_components)
        ev = embedding.fit(X)
        return embedding, ev
    """
    return py"Dummyvar"(X, n_components)
end

function fitLocallyLinearEmbedding(X; n_components=2, n_neighbors=5, eigen_solver="auto")
    #局部线性嵌入LLE
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.manifold import LocallyLinearEmbedding
    def Dummyvar(X, n_components, n_neighbors,eigen_solver):
        embedding = LocallyLinearEmbedding(n_components=n_components,n_neighbors=n_neighbors,eigen_solver=eigen_solver)
        ev = embedding.fit(X)
        return embedding, ev
    """
    return py"Dummyvar"(X, n_components, n_neighbors, eigen_solver)
end

function fitHessianEigenmapping(X; n_neighbors=12, n_components=2)
    #黑森特征映射HE
    py"""
    import pandas as pd
    import numpy as np
    from sklearn import manifold
    def Dummyvar(X, n_components, n_neighbors):
        #embedding = LocallyLinearEmbedding(method="hessian", n_neighbors=n_neighbors, n_components=n_components,eigen_solver="auto",random_state=0)
        # ev = embedding.fit(X)
        params = {
            "n_neighbors": n_neighbors,
            "n_components": n_components,
            "eigen_solver": "auto",
            "random_state": 0,
        }
        lle_standard = manifold.LocallyLinearEmbedding(method="hessian", **params)
        return lle_standard
    """
    return py"Dummyvar"(X, n_components, n_neighbors)
end

function get_curve(n_samples=1500)
    #获取曲线数据
    py"""
    import pandas as pd
    import numpy as np
    from sklearn import datasets
    def Dummyvar(n_samples):
        S_points, S_color = datasets.make_s_curve(n_samples=n_samples, random_state=0)
        return S_points, S_color
    """
    return py"Dummyvar"(n_samples)
end

"""
    get_swiss_roll(; n_samples=1500, hole=false, random_state=nothing)
    获取瑞士卷数据集

    args:
        n_samples(optional): 需要的数据个数
        hole(optional): 是否对瑞士卷 “挖洞”（给数据增加干扰噪声）
        random_state(optional): 随机数种子
    return:
        S_points, S_color: 数据点的三维坐标，数据点绘图时的颜色
"""
function get_swiss_roll(; n_samples=1500, hole=false, random_state=nothing)
    #获取瑞士卷数据
    py"""
    import pandas as pd
    import numpy as np
    from sklearn import datasets
    def Dummyvar(n_samples, hole, random_state):
        S_points, S_color = datasets.make_swiss_roll(
            n_samples=n_samples, 
            random_state=random_state, 
            hole=hole
            )
        return S_points, S_color
    """
    return py"Dummyvar"(n_samples, hole, random_state)
end

function fitltsaEmbedding(X; n_neighbors=12, n_components=2)
    #局部切线空间对齐LTSA
    py"""
    import pandas as pd
    import numpy as np
    from sklearn import manifold
    def Dummyvar(X, n_components, n_neighbors):
        #embedding = LocallyLinearEmbedding(method="hessian", n_neighbors=n_neighbors, n_components=n_components,eigen_solver="auto",random_state=0)
        # ev = embedding.fit(X)
        params = {
            "n_neighbors": n_neighbors,
            "n_components": n_components,
            "eigen_solver": "auto",
            "random_state": 0,
        }
        lle_standard = manifold.LocallyLinearEmbedding(method="ltsa", **params)
        return lle_standard
    """
    return py"Dummyvar"(X, n_components, n_neighbors)
end

function fitSpectralEmbedding(affinity; n_components=2)
    #非线性降维的光谱嵌入SE
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.manifold import SpectralEmbedding
    def Dummyvar(affinity, n_components):
        embedding = SpectralEmbedding(affinity=affinity, n_components=n_components)
        return embedding
    """
    return py"Dummyvar"(affinity, n_components)
end

function fitMLLEmbedding(; n_neighbors=12, n_components=2)
    #改进局部线性嵌入MLLE
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.manifold import LocallyLinearEmbedding
    def Dummyvar(n_neighbors, n_components):
        embedding = LocallyLinearEmbedding(method="modified", n_neighbors=n_neighbors,n_components=n_components)
        return embedding
    """
    return py"Dummyvar"(n_neighbors, n_components)
end

function tsne(;
    n_components=2, perplexity=30, init="pca", learning_rate="auto", n_iter=1000
)
    #t分布随机邻居嵌入
    py"""
    import pandas as pd
    import numpy as np
    from sklearn import manifold
    def Dummyvar(n_components, perplexity,init,learning_rate,n_iter):
        tsne = manifold.TSNE(
            n_components=n_components,
            init=init,
            random_state=0,
            perplexity=perplexity,
            learning_rate=learning_rate,
            n_iter=n_iter,
        )
        return tsne
    """
    return py"Dummyvar"(n_components, perplexity, init, learning_rate, n_iter)
end
