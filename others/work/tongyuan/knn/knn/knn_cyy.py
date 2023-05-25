import numpy as np
from collections import Counter

class KNN:
    def __init__(self, X_train, y_train, n_neighbors=3, p=2):
        """
        parameter: n_neighbors 临近点个数
        parameter: p 距离度量
        """
        self.n = n_neighbors
        self.p = p
        self.X_train = X_train
        self.y_train = y_train

    def predict(self, X):
        knn_list = []
        for i in range(len(self.X_train)):
            dist = np.linalg.norm(X - self.X_train[i], ord=self.p)
            knn_list.append((dist, self.y_train[i]))

        knn_dict = dict(knn_list)
        # 按key排序
        s = sorted(knn_dict.items(), key=lambda x: x[0])[:self.n]
        y = list(dict(s).values())
        count_pairs = Counter(y)
        # 按values排序
        max_count = sorted(count_pairs.items(), key=lambda x: x[1])[-1][0]

        return max_count
