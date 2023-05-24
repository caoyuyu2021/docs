using PyCall

function lasso(
    X,
    y;
    eps=0.001,
    n_alphas=100,
    alphas=nothing,
    precompute="auto",
    max_iter=1000,
    tol=0.0001,
    cv=5,
    random_state=nothing,
    selection="cyclic",
)
    #线性模型的套索或弹性网正则化
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.linear_model import LassoCV
    def lasso_my (X, y,
                    eps,
                    n_alphas,
                    alphas,
                    precompute,
                    max_iter,
                    tol,
                    cv,
                    random_state,
                    selection):
        reg = LassoCV(eps=eps, n_alphas=n_alphas, alphas=alphas, precompute=precompute, max_iter=max_iter, tol=tol, cv=cv, random_state=random_state, selection=selection)
        # 拟合线性模型
        reg.fit(X, y)
        # 权重系数
        w = reg.coef_
        return reg, w
    """
    return py"lasso_my"(
        X, y, eps, n_alphas, alphas, precompute, max_iter, tol, cv, random_state, selection
    )
end
