using PyCall

function ridge(
    X,
    y;
    k=(0.1, 1.0, 10.0),
    scoring=nothing,
    cv=5,
    gcv_mode=nothing,
    store_cv_values=false,
    alpha_per_target=false,
)
    #岭回归
    py"""
    import numpy as np
    import pandas as pd
    import os
    from sklearn.linear_model import RidgeCV
    def ridge_my(X, y, k,scoring,cv,gcv_mode,store_cv_values,alpha_per_target):
        raidgecv = RidgeCV(alphas=k, cv=cv, scoring=scoring, gcv_mode=gcv_mode, store_cv_values=store_cv_values, alpha_per_target=alpha_per_target)
        raidgecv.fit(X, y)
        w = raidgecv.coef_
        return raidgecv, w
    """
    return py"ridge_my"(X, y, k, scoring, cv, gcv_mode, store_cv_values, alpha_per_target)
end
