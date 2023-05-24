# using NaiveBayes
using PyCall

#训练多类朴素贝叶斯模型
# function fitcnb(X, y)
#     p = size(X)[2]
#     X = Array(Array(X)')
#     y = Array(y)
#     model = GaussianNB(unique(y), p)
#     f = NaiveBayes.fit(model, X, y)
#     return f
# end

function fitcnb(X, y; DistributionNames="Gaussian", alpha=1.0, force_alpha=true)
    X = Array(X)
    py"""
    from sklearn.naive_bayes import *
    def KDTreeSearcher(X, y, DistributionNames, alpha, force_alpha):
        if DistributionNames  == "Gaussian":
            clf = GaussianNB()
        elif DistributionNames  == "Multinomial":
            clf = MultinomialNB(alpha=alpha, force_alpha=force_alpha)
        elif DistributionNames  == "Complement":
            clf = ComplementNB(alpha=alpha, force_alpha=force_alpha)
        elif DistributionNames  == "Bernoulli":
            clf = BernoulliNB(alpha=alpha, force_alpha=force_alpha)
        elif DistributionNames  == "Categorical":
            clf = CategoricalNB(alpha=alpha, force_alpha=force_alpha)
        clf.fit(X,y)
        return clf
    """
    py"KDTreeSearcher"(X, y, DistributionNames, alpha, force_alpha)
end
