# using BetaML.Clustering
# using Distributions

#将高斯混合模型拟合到数据
# function fitgmdist(X, k)
#     X = Array(X)
#     GMModel = gmm(X, k)
#     return GMModel
# end

#利用高斯混合分布构造聚类
# function cluster(gm, X)
#     X = Array(X)
#     result = gm.pₙₖ
#     idx = []
#     for i in eachindex(size(X)[1])
#         if maximum(result[i, :]) == result[i, 1]
#             append!(idx, 1)
#         elseif maximum(result[i, :]) == result[i, 2]
#             append!(idx, 2)
#         else
#             append!(idx, 3)
#         end
#     end
#     return idx
# end

#高斯混合分量的后验概率
# function posterior(gm, X)
#     X = Array(X)
#     return gm.pₙₖ
# end

#创建高斯混合模型
# function gmdistribution(mu, sigma)
#     size(mu, 1) #返回行数，代表高斯模型总数，2个代表2个高斯模型的组合
#     size(mu, 2) #返回列数，代表高斯模型变量数，1个即为单变量，多个为多变量

#     mui = Vector{Vector{Float64}}(undef, size(mu, 1)) #空均值向量
#     #将mu按行分组
#     for i in eachindex(size(mu, 1))
#         mui[i] = mu[i, :]
#     end

#     size(sigma, 1) #返回行数，同mu
#     size(sigma, 2) #返回列数，同mu

#     sigmai = Vector{Vector{Float64}}(undef, size(sigma, 1)) #空方差向量
#     #将sigma按行分组
#     for j in eachindex(size(sigma, 1))
#         sigmai[j] = sigma[j, :]
#     end

#     dn = Vector{DiagNormal}(undef, size(mu, 1)) #空高斯模型组合向量
#     #将高斯模型分组
#     for k in eachindex(size(mu, 1))
#         dn[k] = MvNormal(mui[k], sigmai[k])
#     end
#     #返回高斯模型组合结果
#     return MixtureModel(dn)
# end

function fitgmdist(
    X;
    n_components=1,
    covariance_type="full",
    tol=0.001,
    reg_covar=1e-06,
    max_iter=100,
    n_init=1,
    init_params="kmeans",
    weights_init=nothing,
    means_init=nothing,
    precisions_init=nothing,
    random_state=nothing,
    warm_start=false,
    verbose=0,
    verbose_interval=10,
)
    #拟合高斯混合模型
    py"""
    from sklearn.mixture import GaussianMixture
    def Mnrfit(X, n_components, covariance_type, tol, reg_covar, max_iter, n_init, init_params, weights_init, means_init, precisions_init, random_state, warm_start, verbose, verbose_interval):
        gm = GaussianMixture(n_components=n_components, covariance_type=covariance_type, tol=tol, reg_covar=reg_covar, max_iter=max_iter, n_init=n_init, init_params=init_params, weights_init=weights_init, means_init=means_init, precisions_init=precisions_init, warm_start=warm_start, verbose=verbose, verbose_interval=verbose_interval, random_state=random_state)
        gm.fit(X)
        return gm
    """
    return py"Mnrfit"(
        X,
        n_components,
        covariance_type,
        tol,
        reg_covar,
        max_iter,
        n_init,
        init_params,
        weights_init,
        means_init,
        precisions_init,
        random_state,
        warm_start,
        verbose,
        verbose_interval,
    )
end

function gmdistribution(;
    n_components=1,
    covariance_type="full",
    tol=0.001,
    reg_covar=1e-06,
    max_iter=100,
    n_init=1,
    init_params="kmeans",
    weights_init=nothing,
    means_init=nothing,
    precisions_init=nothing,
    random_state=nothing,
    warm_start=false,
    verbose=0,
    verbose_interval=10,
)
    #创建高斯混合模型
    py"""
    from sklearn.mixture import GaussianMixture
    def Mnrfit(n_components, covariance_type, tol, reg_covar, max_iter, n_init, init_params, weights_init, means_init, precisions_init, random_state, warm_start, verbose, verbose_interval):
        gm = GaussianMixture(n_components=n_components, covariance_type=covariance_type, tol=tol, reg_covar=reg_covar, max_iter=max_iter, n_init=n_init, init_params=init_params, weights_init=weights_init, means_init=means_init, precisions_init=precisions_init, warm_start=warm_start, verbose=verbose, verbose_interval=verbose_interval, random_state=random_state)
        return gm
    """
    return py"Mnrfit"(
        n_components,
        covariance_type,
        tol,
        reg_covar,
        max_iter,
        n_init,
        init_params,
        weights_init,
        means_init,
        precisions_init,
        random_state,
        warm_start,
        verbose,
        verbose_interval,
    )
end

function posterior(mdl, X)
    #高斯混合分量的后验概率
    py"""
    from sklearn.linear_model import LogisticRegression
    def Mnrfit(mdl, X):
        p = mdl.predict_proba(X)
        nlogl = mdl.score_samples(X)
        return p, nlogl
    """
    return py"Mnrfit"(mdl, X)
end

function randomgm(mdl, n)
    #高斯混合分布的随机变量
    py"""
    from sklearn.linear_model import LogisticRegression
    def Mnrfit(mdl, n):
        x, y = mdl.sample(n)
        return x, y
    """
    return py"Mnrfit"(mdl, n)
end