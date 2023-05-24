using CSV
using DataFrames
using PyCall

#适合支持向量机或其他分类器的多类模型
function fitcecoc(X, y)
    X = Array(X)
    y = Array(y)

    py"""
    from sklearn.multiclass import OutputCodeClassifier
    from sklearn.svm import SVC
    #训练模型
    def Fitcecoc(X, y):
        clf = OutputCodeClassifier(estimator=SVC(kernel = 'rbf', random_state=0), random_state=0).fit(X, y)
        return clf
    """
    py"Fitcecoc"(X, y)
end
