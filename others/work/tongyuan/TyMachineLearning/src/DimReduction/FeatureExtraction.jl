using PyCall

function transform(X)
    #将预测器转换为提取的特征
    py"""
    from sklearn.decomposition import PCA
    def Anova(X):
        pca =PCA()
        lm = pca.fit(X)
        coeff = lm.components_
        return coeff
    """
    return py"Anova"(X)
end
