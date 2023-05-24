# using LIBSVM
using CSV
using DataFrames
using PyCall

#训练用于一类和二类分类的支持向量机 (SVM) 分类器
# function fitcsvm(X, y)
#     X = Array(Array(X)')
#     y = Array(y)
#     return svmtrain(X, y)
# end
function fitcsvm(
    X,
    y;
    C=1.0,
    kernel="rbf",
    degree=3,
    gamma="scale",
    coef0=0.0,
    shrinking=true,
    probability=false,
    tol=0.001,
    cache_size=200,
    class_weight=nothing,
    verbose=false,
    max_iter=-1,
    decision_function_shape="ovr",
    break_ties=false,
    random_state=nothing,
)
    #高维数据的线性分类模型拟合
    py"""
    import numpy as np
    import pandas as pd
    from sklearn import svm
    def Fitckernel(X, y, C, kernel, degree, gamma, coef0, shrinking, probability, tol, cache_size, class_weight, verbose, max_iter, decision_function_shape, break_ties, random_state):
        clf = svm.SVC(C=C, kernel=kernel,degree=degree,gamma=gamma,coef0=coef0,shrinking=shrinking,probability=probability,tol=tol,cache_size=cache_size,class_weight=class_weight,verbose=verbose,max_iter=max_iter,decision_function_shape=decision_function_shape,break_ties=break_ties,random_state=random_state)
        clf.fit(X, y.ravel())
        return clf
    """
    return py"Fitckernel"(
        X,
        y,
        C,
        kernel,
        degree,
        gamma,
        coef0,
        shrinking,
        probability,
        tol,
        cache_size,
        class_weight,
        verbose,
        max_iter,
        decision_function_shape,
        break_ties,
        random_state,
    )
end

#将线性分类模型拟合到高维数据
function fitclinear(X, y)
    X = Array(X)
    y = Array(y)

    py"""
    from sklearn.multiclass import OutputCodeClassifier
    from sklearn.svm import LinearSVC
    import pandas as pd
    
    def Fitclinear(X, y):
        #训练模型
        clf = LinearSVC(random_state=0, max_iter=10000).fit(X, y)
        return clf
    """
    return py"Fitclinear"(X, y)
end

#用随机特征展开拟合高斯核分类模型
function fitckernel(
    X,
    y;
    C=1.0,
    kernel="rbf",
    degree=3,
    gamma="scale",
    coef0=0.0,
    shrinking=true,
    probability=false,
    tol=0.001,
    cache_size=200,
    class_weight=nothing,
    verbose=false,
    max_iter=-1,
    decision_function_shape="ovr",
    break_ties=false,
    random_state=nothing,
)
    #高维数据的线性分类模型拟合
    py"""
    import numpy as np
    import pandas as pd
    from sklearn import svm
    def Fitckernel(X, y, C, kernel, degree, gamma, coef0, shrinking, probability, tol, cache_size, class_weight, verbose, max_iter, decision_function_shape, break_ties, random_state):
        clf = svm.SVC(C=C, kernel=kernel,degree=degree,gamma=gamma,coef0=coef0,shrinking=shrinking,probability=probability,tol=tol,cache_size=cache_size,class_weight=class_weight,verbose=verbose,max_iter=max_iter,decision_function_shape=decision_function_shape,break_ties=break_ties,random_state=random_state)
        clf.fit(X, y.ravel())
        return clf
    """
    return py"Fitckernel"(
        X,
        y,
        C,
        kernel,
        degree,
        gamma,
        coef0,
        shrinking,
        probability,
        tol,
        cache_size,
        class_weight,
        verbose,
        max_iter,
        decision_function_shape,
        break_ties,
        random_state,
    )
end