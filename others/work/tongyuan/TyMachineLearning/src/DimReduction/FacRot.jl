using PyCall

#因子分析
function factoran(X, m)
    #X是二维数组
    py"""
    from sklearn.decomposition import FactorAnalysis
    
    def rotatefac (X,m):
        transformer=FactorAnalysis(n_components=m, max_iter=10000)
        transformed=transformer.fit_transform(X)
        return transformed
    """
    return py"rotatefac"(X, m)
end

#旋转系数荷载
function rotatefactors(X, m)
    #X是二维数组
    py"""
    from sklearn.decomposition import FactorAnalysis
    import numpy.linalg as nlg #导入nlg函数，linalg=linear+algebra
    from math import sqrt
    from numpy import eye, asarray, dot, sum, diag #导入eye,asarray,dot,sum,diag 函数
    from numpy.linalg import svd #导入奇异值分解函数
    
    def rotatefac (X,m):
        transformer=FactorAnalysis(n_components=m, max_iter=10000)
        transformed=transformer.fit_transform(X)
        def varimax(Phi, gamma = 1.0, q =10, tol = 1e-6): #定义方差最大旋转函数
            p,k = Phi.shape #给出矩阵Phi的总行数，总列数
            R = eye(k) #给定一个k*k的单位矩阵
            d=0
            for i in range(q):
                d_old = d
                Lambda = dot(Phi, R)#矩阵乘法
                u,s,vh = svd(dot(Phi.T,asarray(Lambda)**3 - (gamma/p) * dot(Lambda, diag(diag(dot(Lambda.T,Lambda)))))) #奇异值分解svd
                R = dot(u,vh)#构造正交矩阵R
                d = sum(s)#奇异值求和
            if d_old!=0 and d/d_old:
                return dot(Phi, R)#返回旋转矩阵Phi*R
        rotation_mat=varimax(transformed)
        return rotation_mat
    """
    return py"rotatefac"(X, m)
end
