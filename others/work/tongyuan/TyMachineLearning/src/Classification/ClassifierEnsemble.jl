using PyCall

function templateKNN(X, n_estimators)
    #knn集成学习
    y = names(X)
    X = Array(X)
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import BaggingClassifier
    from sklearn.neighbors import KNeighborsClassifier
    def Dummyvar(X, y, n_estimators):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        y1 = data1.iloc[:,-1]
        y2 = y1.values
        bagging = BaggingClassifier(KNeighborsClassifier(),n_estimators=n_estimators,
                            max_samples=0.5, max_features=0.5, random_state=0)
        clf = bagging.fit(x1.values, y2.astype('int'))
        return clf
    """
    return py"Dummyvar"(X, y, n_estimators)
end

function templateSVM(X, n_estimators)
    #SVM集成学习
    y = names(X)
    X = Array(X)
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import BaggingClassifier
    from sklearn import svm
    def Dummyvar(X, y, n_estimators):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        y1 = data1.iloc[:,-1]
        y2 = y1.values
        bagging = BaggingClassifier(svm.SVC(),n_estimators=n_estimators,
                             random_state=0)
        clf = bagging.fit(x1.values, y2.astype('int'))
        return clf
    """
    return py"Dummyvar"(X, y, n_estimators)
end

function templateNaiveBayes(X, n_estimators)
    #朴素贝叶斯集成学习
    y = names(X)
    X = Array(X)
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import BaggingClassifier
    from sklearn.naive_bayes import GaussianNB
    def Dummyvar(X, y, n_estimators):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        y1 = data1.iloc[:,-1]
        y2 = y1.values
        bagging = BaggingClassifier(GaussianNB(),n_estimators=n_estimators,
                             random_state=0)
        clf = bagging.fit(x1.values, y2.astype('int'))
        return clf
    """
    return py"Dummyvar"(X, y, n_estimators)
end

function templateTree(X, n_estimators, depth=5)
    #knn集成学习
    y = names(X)
    X = Array(X)
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import BaggingClassifier
    from sklearn import tree
    def Dummyvar(X, y, n_estimators, depth):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        y1 = data1.iloc[:,-1]
        y2 = y1.values
        tree_m = tree.DecisionTreeClassifier(criterion='entropy',max_depth=depth)
        bagging = BaggingClassifier(tree_m,n_estimators=n_estimators,
                             random_state=0)
        clf = bagging.fit(x1.values, y2.astype('int'))
        return clf
    """
    return py"Dummyvar"(X, y, n_estimators, depth)
end

function templateDiscriminant(X, n_estimators)
    #knn集成学习
    y = names(X)
    X = Array(X)
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import BaggingClassifier
    from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
    def Dummyvar(X, y, n_estimators):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        y1 = data1.iloc[:,-1]
        y2 = y1.values
        tree_m = LinearDiscriminantAnalysis()
        bagging = BaggingClassifier(tree_m,n_estimators=n_estimators,
                             random_state=0)
        clf = bagging.fit(x1.values, y2.astype('int'))
        return clf
    """
    return py"Dummyvar"(X, y, n_estimators)
end

function templateECOC(X, n_estimators)
    #ECOC集成学习
    y = names(X)
    X = Array(X)
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import BaggingClassifier
    from sklearn import svm
    def Dummyvar(X, y, n_estimators):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        y1 = data1.iloc[:,-1]
        y2 = y1.values
        tree_m = svm.SVC(kernel = 'rbf', random_state=0)
        bagging = BaggingClassifier(tree_m,n_estimators=n_estimators,
                             random_state=0)
        clf = bagging.fit(x1.values, y2.astype('int'))
        return clf
    """
    return py"Dummyvar"(X, y, n_estimators)
end

function AdaBoostTree(X, n_estimators, learn_rate, max_depth=9, min_samples_leaf=1)
    #AdaBoostTree集成学习
    y = names(X)
    X = Array(X)
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import AdaBoostClassifier
    from sklearn.tree import DecisionTreeClassifier
    def Dummyvar(X, y, n_estimators, learn_rate,max_depth,min_samples_leaf):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        y1 = data1.iloc[:,-1]
        y2 = y1.values        
        ada_discrete = AdaBoostClassifier(
                        DecisionTreeClassifier(max_depth=max_depth, min_samples_leaf=min_samples_leaf),
                        learning_rate=learn_rate,
                        n_estimators=n_estimators,
                        algorithm="SAMME",
                    )
        clf = ada_discrete.fit(x1.values, y2.astype('int'))
        return clf
    """
    return py"Dummyvar"(X, y, n_estimators, learn_rate, max_depth, min_samples_leaf)
end

function templateEnsemble(
    X,
    method="AdaBoost",
    n_estimators=10,
    learners="Tree",
    learn_rate=1.0,
    max_depth=9,
    min_samples_leaf=1,
)
    if method == "AdaBoost"
        model = AdaBoostTree(X, n_estimators, learn_rate, max_depth, min_samples_leaf)
    elseif method == "Bag"
        if learners == "Discriminant"
            model = templateDiscriminant(X, n_estimators)
        elseif learners == "KNN"
            model = templateKNN(X, n_estimators)
        elseif learners == "Tree"
            model = templateTree(X, n_estimators)
        end
    end
    return model
end

function templateLinear(X, n_estimators, learner="svm")
    #Linear分类器
    y = names(X)
    X = Array(X)
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import BaggingClassifier
    from sklearn import svm
    from sklearn.linear_model import RidgeClassifier
    from sklearn.linear_model import LogisticRegression
    def Dummyvar(X, y, n_estimators, learner):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        y1 = data1.iloc[:,-1]
        y2 = y1.values
        if learner == "svm":
            clas_m = svm.SVC(kernel = 'rbf', random_state=0)
        elif learner == "logistic":
            clas_m = LogisticRegression(random_state=0)
        elif learner == "ridge":
            clas_m = RidgeClassifier()
        bagging = BaggingClassifier(clas_m,n_estimators=n_estimators,
                             random_state=0)
        clf = bagging.fit(x1.values, y2.astype('int'))
        return clf
    """
    return py"Dummyvar"(X, y, n_estimators, learner)
end

function templateKernel(X, n_estimators)
    #内核模型模板
    y = names(X)
    X = Array(X)
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import BaggingClassifier
    from sklearn import svm
    def Dummyvar(X, y, n_estimators):
        X = pd.DataFrame(X)
        data1 = X.dropna()
        data1 = data1.copy()
        for i in range(len(y)):
            data1.rename(columns={i: y[i]}, inplace=True)
        x1 = data1.iloc[:,:-1]
        y1 = data1.iloc[:,-1]
        y2 = y1.values
        bagging = BaggingClassifier(svm.SVC(),n_estimators=n_estimators,
                             random_state=0)
        clf = bagging.fit(x1.values, y2.astype('int'))
        return clf
    """
    return py"Dummyvar"(X, y, n_estimators)
end

function oobPredict(mdl, X::Matrix)
    #集成预测
    py"""
    def Dummyvar(mdl, X):
        y_pre = mdl.predict(X)
        return y_pre
    """
    return py"Dummyvar"(mdl, X)
end

function fitcensemble(
    X,
    method="AdaBoost",
    n_estimators=10,
    learners="Tree",
    learn_rate=1.0,
    max_depth=9,
    min_samples_leaf=1,
)
    if method == "AdaBoost"
        model = AdaBoostTree(X, n_estimators, learn_rate, max_depth, min_samples_leaf)
    elseif method == "Bag"
        if learners == "Discriminant"
            model = templateDiscriminant(X, n_estimators)
        elseif learners == "KNN"
            model = templateKNN(X, n_estimators)
        elseif learners == "Tree"
            model = templateTree(X, n_estimators)
        end
    end
    return model
end

function ty_make_classification(;
    n_samples=1000,
    n_features=4,
    n_informative=2,
    n_redundant=0,
    random_state=0,
    shuffle="False",
)
    #获取分类数据
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.datasets import make_classification
    def Dummyvar(n_samples, n_features, n_informative,n_redundant,random_state,shuffle):
        if shuffle == "False":
            X, y = make_classification(n_samples=n_samples, n_features=n_features,
                            n_informative=n_informative, n_redundant=n_redundant,
                            random_state=random_state, shuffle=False)
        elif shuffle == "True":
            X, y = make_classification(n_samples=n_samples, n_features=n_features,
                            n_informative=n_informative, n_redundant=n_redundant,
                            random_state=random_state, shuffle=True)
        return X, y
    """
    return py"Dummyvar"(
        n_samples, n_features, n_informative, n_redundant, random_state, shuffle
    )
end

function randomcforest(
    X,
    y;
    max_depth=2,
    n_estimators=100,
    criterion="gini",
    min_samples_split=2,
    min_samples_leaf=1,
    min_weight_fraction_leaf=0.0,
    max_features="sqrt",
)
    #随机森林
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import RandomForestClassifier
    def Dummyvar(X, y, max_depth, n_estimators, criterion, min_samples_split, min_samples_leaf,min_weight_fraction_leaf,max_features):
        clf = RandomForestClassifier(max_depth=max_depth, random_state=0,n_estimators=n_estimators,
                criterion=criterion,
                min_samples_split=min_samples_split,
                min_samples_leaf=min_samples_leaf,
                min_weight_fraction_leaf=min_weight_fraction_leaf,
                max_features=max_features)
        clf.fit(X, y)
        return clf
    """
    return py"Dummyvar"(
        X,
        y,
        max_depth,
        n_estimators,
        criterion,
        min_samples_split,
        min_samples_leaf,
        min_weight_fraction_leaf,
        max_features,
    )
end

function ty_train_test_split(X, y; test_size=0.4)
    #获取分类数据
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.model_selection import train_test_split
    def Dummyvar(X, y, test_size):
        X_train, X_test, y_train, y_test = train_test_split(X, y,test_size=test_size, random_state=42)
        return X_train, X_test, y_train, y_test
    """
    return py"Dummyvar"(X, y, test_size)
end

function GradientcBoosting(
    X,
    y;
    max_depth=3,
    n_estimators=100,
    loss="exponential",
    learning_rate=0.1,
    subsample=1.0,
    criterion="friedman_mse",
    min_samples_split=2,
    min_samples_leaf=1,
    min_weight_fraction_leaf=0.0,
    min_impurity_decrease=0.0,
    alpha=0.9,
)
    #随机森林
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import GradientBoostingClassifier
    def Dummyvar(X, y, max_depth, n_estimators, loss, learning_rate, subsample, criterion, min_samples_split, min_samples_leaf,min_weight_fraction_leaf,min_impurity_decrease,alpha):
        clf = GradientBoostingClassifier(max_depth=max_depth, random_state=0,n_estimators=n_estimators,
                loss=loss,
                learning_rate=learning_rate,
                subsample=subsample,
                criterion=criterion,
                min_samples_split=min_samples_split,
                min_samples_leaf=min_samples_leaf,
                min_weight_fraction_leaf=min_weight_fraction_leaf,)
        clf.fit(X, y)
        return clf
    """
    return py"Dummyvar"(
        X,
        y,
        max_depth,
        n_estimators,
        loss,
        learning_rate,
        subsample,
        criterion,
        min_samples_split,
        min_samples_leaf,
        min_weight_fraction_leaf,
        min_impurity_decrease,
        alpha,
    )
end

function resume(clf, X, y, n_estimators)
    #增加模型迭代次数
    py"""
    from sklearn.metrics import mean_squared_error
    def Loss_rgp (clf, X, y, n_estimators):
        clf.set_params(n_estimators=n_estimators, warm_start=True)
        clf.fit(X, y)
        return clf
    """
    return py"Loss_rgp"(clf, X, y, n_estimators)
end

function HistcGradientBoosting(
    X,
    y;
    max_iter=100,
    loss="auto",
    learning_rate=0.1,
    max_leaf_nodes=31,
    min_samples_leaf=20,
    l2_regularization=0,
    max_bins=255,
)
    #随机森林
    py"""
    import pandas as pd
    import numpy as np
    from sklearn.ensemble import HistGradientBoostingClassifier
    def Dummyvar(X, y, max_iter, loss, learning_rate, max_leaf_nodes, min_samples_leaf,l2_regularization,max_bins):
        clf = HistGradientBoostingClassifier(max_iter=max_iter, random_state=0,
                loss=loss,
                learning_rate=learning_rate,
                max_leaf_nodes=max_leaf_nodes,
                min_samples_leaf=min_samples_leaf,
                l2_regularization=l2_regularization,
                max_bins=max_bins)
        clf.fit(X, y)
        return clf
    """
    return py"Dummyvar"(
        X,
        y,
        max_iter,
        loss,
        learning_rate,
        max_leaf_nodes,
        min_samples_leaf,
        l2_regularization,
        max_bins,
    )
end

function VotingClassifier(X, y, estimators, weights; voting="soft")
    #集成预测
    py"""
    from sklearn.ensemble import VotingClassifier
    def Dummyvar(X, y, estimators, weights, voting):
        eclf = VotingClassifier(estimators=estimators,
                        voting=voting, weights=weights)
        eclf.fit(X, y)               
        return eclf
    """
    return py"Dummyvar"(X, y, estimators, weights, voting)
end
