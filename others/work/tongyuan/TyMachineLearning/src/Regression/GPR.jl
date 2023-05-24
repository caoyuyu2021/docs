using PyCall

function fitrgp(
    X,
    y;
    kernel=nothing,
    alpha=1e-10,
    optimizer="fmin_l_bfgs_b",
    n_restarts_optimizer=0,
    normalize_y=false,
    copy_X_train=true,
    random_state=nothing,
)
    #拟合高斯过程回归（GPR）模型
    py"""
    import numpy as np
    import pandas as pd
    from sklearn.gaussian_process import GaussianProcessRegressor
    def Fitckernel(X, y,kernel,
                    alpha,
                    optimizer,
                    n_restarts_optimizer,
                    normalize_y,
                    copy_X_train,
                    random_state,):
        gaussian=GaussianProcessRegressor(kernel=kernel, alpha=alpha, optimizer=optimizer, n_restarts_optimizer=n_restarts_optimizer, normalize_y=normalize_y, copy_X_train=copy_X_train, random_state=random_state)
        clf=gaussian.fit(X, y)
        return clf
    """
    return py"Fitckernel"(
        X,
        y,
        kernel,
        alpha,
        optimizer,
        n_restarts_optimizer,
        normalize_y,
        copy_X_train,
        random_state,
    )
end
