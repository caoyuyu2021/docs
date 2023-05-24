using PyCall

#非负矩阵分解
function nnmf(X, k)
    py"""
    from sklearn.decomposition import NMF
    def Nnmf(X, k):
        nmf = NMF(n_components=k, init="random", random_state=0,max_iter=10000)
        W = nmf.fit_transform(X)
        H = nmf.components_
        return [W,H]
    """
    return py"Nnmf"(X, k)
end
