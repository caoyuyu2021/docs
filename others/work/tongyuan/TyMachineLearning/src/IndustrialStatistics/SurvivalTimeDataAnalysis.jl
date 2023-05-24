using PyCall

function coxphfit(X, name1, name2)
    y = names(X)
    X = Array(X)
    #考克斯比例风险回归
    py"""
    import numpy as np
    import pandas as pd
    from lifelines.datasets import load_regression_dataset
    from lifelines import CoxPHFitter
    def Fitckernel(X, y, name1, name2):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        cph2 = CoxPHFitter()
        cph2.fit(data1, name1, name2)
        return cph2
    """
    return py"Fitckernel"(X, y, name1, name2)
end

function ecdf(y)
    X = Array(y)
    #经验累积分布函数
    py"""
    import numpy as np
    import pandas as pd
    import numpy as np
    import statsmodels.api as sm
    def Fitckernel(X):
        res = sm.distributions.ECDF(X)
        return res
    """
    return py"Fitckernel"(X)
end

function ksdensity(X)
    #单变量和双变量数据的核平滑函数估计
    py"""
    import pandas as pd
    import numpy as np
    from scipy.stats import gaussian_kde
    import scipy.stats as stats
    def Anova(X):
        kenal = gaussian_kde(X)
        z = kenal.evaluate(X)
        idx = z.argsort()
        x, z = X[idx], z[idx]
        return x, z
    """
    return py"Anova"(X)
end

function mle(X)
    y = names(X)
    X = Array(X)
    #最大似然估计
    py"""
    import numpy as np
    import pandas as pd
    import scipy
    from scipy.stats import norm
    def Fitckernel(X, y):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x_mean, x_std = norm.fit(data1)
        return x_mean, x_std
    """
    return py"Fitckernel"(X, y)
end

function fitdist(X, name)
    #对数据进行概率分布对象拟合
    py"""
    import matplotlib as mpl
    import matplotlib.pyplot as plt
    from distfit import distfit
    def Anova(X, name):
        dist = distfit(distr=name,todf=True)
        dist.fit_transform(X)
        return dist
    """
    return py"Anova"(X, name)
end

function evfit(X, c)
    #极值参数估计
    py"""
    import numpy as np
    import pandas as pd
    from scipy.stats import genextreme
    def Fitckernel(X, c):
        res = genextreme.fit(X, c, loc=0, scale=1)
        rv = genextreme(c)
        return res, rv
    """
    return py"Fitckernel"(X, c)
end

function get_stadata(c, size, catagory)
    py"""
    from scipy.stats import expon
    from scipy.stats import genextreme
    from scipy.stats import gamma
    from scipy.stats import lognorm
    from scipy.stats import norm
    def Fitckernel(c, size, catagory):
        if catagory == "genextreme":
            data = genextreme.rvs(c, size=size, random_state=1)
        elif catagory == "expon":
            data = expon.rvs(scale=1/c, size=size, random_state=1)
        elif catagory == "gamma":
            data = gamma.rvs(c, size=size, random_state=1)
        elif catagory == "lognorm":
            data = lognorm.rvs(c, size=size, random_state=1)
        elif catagory == "norm":
            data = norm.rvs(loc=0, scale=1, size=size, random_state=1)
        return data
    """
    return py"Fitckernel"(c, size, catagory)
end

function expfit(X, c)
    #指数参数估计
    py"""
    import numpy as np
    import pandas as pd
    from scipy.stats import expon
    def Fitckernel(X, c):
        res = expon.fit(X, loc=0, scale=1/c)
        rv = expon()
        return res, rv
    """
    return py"Fitckernel"(X, c)
end

function gamfit(X, c)
    #伽马参数估计
    py"""
    import numpy as np
    import pandas as pd
    from scipy.stats import gamma
    def Fitckernel(X, c):
        res = gamma.fit(X, c, loc=0, scale=1)
        rv = gamma(c)
        return res, rv
    """
    return py"Fitckernel"(X, c)
end

function normfit(X, c)
    #正态参数估计
    py"""
    import numpy as np
    import pandas as pd
    from scipy.stats import norm
    def Fitckernel(X, c):
        res = norm.fit(X, loc=0, scale=1)
        rv = norm()
        return res, rv
    """
    return py"Fitckernel"(X, c)
end

function lognfit(X, c)
    #对数正态参数估计
    py"""
    import numpy as np
    import pandas as pd
    from scipy.stats import lognorm
    def Fitckernel(X, c):
        res = gamma.fit(X, c, loc=0, scale=1)
        rv = gamma(c)
        return res, rv
    """
    return py"Fitckernel"(X, c)
end

function wblfit(X, a, b)
    #威布尔参数估计
    py"""
    import numpy as np
    import pandas as pd
    from scipy.stats import exponweib
    def Fitckernel(X, a, b):
        res = exponweib.fit(X, a, b, loc=0, scale=1)
        rv = exponweib(a, b)
        return res, rv
    """
    return py"Fitckernel"(X, a, b)
end

function get_wbldata(size)
    py"""
    from scipy.stats import exponweib
    def Fitckernel(size):
        numargs = exponweib .numargs
        [a, b] = [0.6,] * numargs
        rv = exponweib (a, b)
        data = exponweib.rvs(a, b, scale=2, size=size, random_state=1)
        return data, a, b
    """
    return py"Fitckernel"(size)
end
