函数 KNN:
    输入: 
        X_train - 训练数据特征矩阵
        y_train - 训练数据标签
        X_test - 测试数据特征矩阵
        k - 最近邻数
        
    输出:
        y_pred - 预测标签向量
        
    对于每个测试样本 X_test[i]:
        计算 X_test[i] 与 X_train 中每个训练样本的距离
        根据距离排序并选择前 k 个最近邻的索引
        
        初始化一个字典 counts
        
        对于每个最近邻索引 j:
            获取训练样本的标签 label = y_train[j]
            counts[label] = counts[label] + 1 （如果 label 已存在）或者 counts[label] = 1 （如果 label 不存在）
        
        选择具有最高票数的标签作为预测结果 y_pred[i]
    
    返回 y_pred