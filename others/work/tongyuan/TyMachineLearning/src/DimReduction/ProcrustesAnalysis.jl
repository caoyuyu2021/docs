using PyCall

function procrustes(X1, X2)
    #对数据进行普氏分析
    py"""
    from scipy.spatial import procrustes
    def Anova(X1, X2):
        mtx1, mtx2, disparity = procrustes(X1, X2)
        return mtx1, mtx2, disparity
    """
    return py"Anova"(X1, X2)
end
