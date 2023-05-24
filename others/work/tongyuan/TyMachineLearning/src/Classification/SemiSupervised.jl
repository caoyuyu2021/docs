using CSV
using DataFrames
using PyCall

#基于半监督图方法的标签数据
function fitsemigraph(X, y, UnlabeledX)
    X = Array(X)
    y = Array(y)
    UnlabeledX = Array(UnlabeledX)

    py"""
    from sklearn.semi_supervised import LabelPropagation
    import pandas as pd
    import numpy as np
    def FitSemigraph(X, y,UnlabeledX):
        X = pd.DataFrame(X)
        y = pd.DataFrame(y)
        UnlabeledX = pd.DataFrame(UnlabeledX)
        #混合数据
        n = X.shape[1]
        UnlabeledX[n] = -1
        y = pd.concat([y, UnlabeledX[n]], axis=0)
        UnlabeledX = UnlabeledX.iloc[:,:-1]
        X = pd.concat([X, UnlabeledX], axis=0)
        #训练模型
        label_prop_model = LabelPropagation(kernel='knn')
        y = np.array(y).ravel()
        clf = label_prop_model.fit(X, y)
        Unlabeledy = clf.predict(UnlabeledX)
        return clf, Unlabeledy
    """
    return py"FitSemigraph"(X, y, UnlabeledX)[1], py"FitSemigraph"(X, y, UnlabeledX)[2]
end

#基于半监督自训练方法的标签数据
function fitsemiself(X, y, UnlabeledX)
    X = Array(X)
    y = Array(y)
    UnlabeledX = Array(UnlabeledX)

    py"""
    from sklearn.semi_supervised import SelfTrainingClassifier
    from sklearn.svm import SVC
    import pandas as pd
    import numpy as np
    def FitSemiself(X, y,UnlabeledX):
        X = pd.DataFrame(X)
        y = pd.DataFrame(y)
        UnlabeledX = pd.DataFrame(UnlabeledX)
        #混合数据
        n = X.shape[1]
        UnlabeledX[n] = -1
        y = pd.concat([y, UnlabeledX[n]], axis=0)
        UnlabeledX = UnlabeledX.iloc[:,:-1]
        X = pd.concat([X, UnlabeledX], axis=0)
        #训练模型
        svc = SVC(probability=True, gamma="auto")
        self_training_model = SelfTrainingClassifier(svc)
        y = np.array(y).ravel()
        clf = self_training_model.fit(X, y)
        Unlabeledy = clf.predict(UnlabeledX)
        return clf, Unlabeledy
    """
    return py"FitSemiself"(X, y, UnlabeledX)[1], py"FitSemiself"(X, y, UnlabeledX)[2]
end
