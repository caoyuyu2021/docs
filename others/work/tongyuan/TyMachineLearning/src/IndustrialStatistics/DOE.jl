using PyCall

function lhsdesign(sample_number, list_min, list_max, list_digit)
    list_min = Array(list_min)
    list_max = Array(list_max)
    list_digit = Array(list_digit)
    #拉丁超立方体样本
    py"""
    import numpy as np
    import pandas as pd
    import random
    def mdUDLhsample(sample_number,list_min,list_max,list_digit):
        list_min = list_min.tolist()
        list_max = list_max.tolist()
        list_digit = list_digit.tolist()
        assert len(list_min) == len(list_max) == len(list_digit), "数据维度不匹配"
        length = len(list_min)
        array_min = [float(i) for i in list_min]
        array_max = [float(i) for i in list_max]
        array_digit = [float(i) for i in list_digit]
        array_min = np.array(array_min)
        array_max = np.array(array_max)
        array_digit = np.array(array_digit)
        array_min = array_min.reshape((length,1))
        array_max = array_max.reshape((length, 1))
        array_digit = array_digit.reshape((length, 1))
        array_u = np.hstack((array_min,array_max))
        array_u = np.hstack((array_u, array_digit))
        sample_data = np.zeros((array_u.shape[0], sample_number))
        sample_random_data = []
        def uDLhsample(sample_number, min_number, max_number, digit):
            assert max_number >= min_number, "最大值必须大于等于最小值"
            coefficient_lower = []
            coefficient_upper = []
            # 离散的均匀分布随机采样
            if digit == 0:
                for i in range(sample_number):
                    coefficient_lower.append(int(min_number + i * (max_number - min_number) / sample_number))
                    coefficient_upper.append(int(min_number + (i + 1) * (max_number - min_number) / sample_number))
                # 放回抽样
                result = []
                for i in range(sample_number):
                    while len(result) < (i + 1):
                        b = np.random.randint(coefficient_lower[i], coefficient_upper[i], 1)
                        result.append(b[0])
                sample_data = list(result)
                return sample_data

            # 连续的均匀分布随机采样
            else:
                digit = int(digit)
                for i in range(sample_number):
                    coefficient_lower.append(min_number + i * (max_number - min_number) / sample_number)
                    coefficient_upper.append(min_number + (i + 1) * (max_number - min_number) / sample_number)
                #  =====这里有修改=========
                # result = set()
                # 并且下面的append改为了add,改为不可重复抽样
                result = []
                for i in range(sample_number):
                    while len(result) < (i + 1):
                        result.append(round(random.uniform(coefficient_lower[i], coefficient_upper[i]), digit))
                sample_data = list(result)
                return sample_data
        for i in range(array_u.shape[0]):
            sample_data[i, :] = np.array(
                uDLhsample(sample_number, array_u[i, 0], array_u[i, 1], array_u[i, 2]))
            np.random.shuffle(sample_data[i, :])  # 打乱顺序
        for j in range(sample_number):
            sample_random_data.append(sample_data[:, j].tolist())
        return sample_random_data
    """
    return py"mdUDLhsample"(sample_number, list_min, list_max, list_digit)
end

function fullfact(n, list_min, list_max, list_digit)
    list_min = Array(list_min)
    list_max = Array(list_max)
    list_digit = Array(list_digit)
    #全因子设计
    py"""
    import numpy as np
    import pandas as pd
    def fullFactorial(n, list_min, list_max, list_digit):
        list_min =list_min.tolist()
        list_max =list_max.tolist()
        list_digit =list_digit.tolist()
        assert n == len(list_min) == len(list_max) == len(list_digit), "数据维度不匹配"
        array_min = [float(i) for i in list_min]
        array_max = [float(i) for i in list_max]
        array_digit = [float(i) for i in list_digit]
        array_min = np.array(array_min)
        array_max = np.array(array_max)
        array_digit = np.array(array_digit)
        array_min = array_min.reshape((n,1))
        array_max = array_max.reshape((n, 1))
        array_digit = array_digit.reshape((n, 1))
        array_u = np.hstack((array_min,array_max))
        array_u = np.hstack((array_u, array_digit))
        list_a =[]
        output_list=[]
        levels = []
        for i in range(n):
            a = pow(10,-array_u[i,2])
            # 取出所有可能的值放入一个列表中。
            list_b = np.round(np.arange(array_u[i,0],array_u[i,1],a),int(array_u[i,2])).tolist()
            list_a.append(list_b)
            levels.append(len(list_b))
        level_repeat = 1
        range_repeat = np.prod(levels)
        H = np.zeros((range_repeat, n))
        for i in range(n):
            range_repeat /= levels[i]  # range_report = range_report/levels[i]
            lvl = []
            for j in list_a[i]:
                lvl += [j] * level_repeat  # lvl = lvl +[j] * level_repeat
            rng = lvl * int(range_repeat)
            level_repeat *= levels[i]  # level_repeat=level_repeat*levels[i]
            H[:, i] = rng

        for i in range(H.shape[0]):
            output_list.append(H[i,:].tolist())

        return output_list
    """
    return py"fullFactorial"(n, list_min, list_max, list_digit)
end

function ff2n(n)
    #两级全析因设计
    py"""
    import numpy as np
    import pandas as pd
    def ff2n_v(n):
        def fullfact(levels):
            n = len(levels)  # number of factors
            nb_lines = np.prod(levels)  # number of trial conditions
            H = np.zeros((nb_lines, n))
            level_repeat = 1
            range_repeat = np.prod(levels)
            for i in range(n):
                range_repeat /= levels[i]  # range_report = range_report/levels[i]
                lvl = []
                for j in range(levels[i]):
                    lvl += [j] * level_repeat  # lvl = lvl +[j] * level_repeat
                rng = lvl * int(range_repeat)
                level_repeat *= levels[i]  # level_repeat=level_repeat*levels[i]
                H[:, i] = rng
            return H
        return 2 * fullfact([2] * n) - 1
    """
    return py"ff2n_v"(n)
end

function fracfact(n, list_min, list_max, list_digit, m)
    list_min = Array(list_min)
    list_max = Array(list_max)
    list_digit = Array(list_digit)
    #分数析因设计
    py"""
    import numpy as np
    import pandas as pd
    import math
    def D_optimal(n, list_min, list_max, list_digit, m):
        list_min =list_min.tolist()
        list_max =list_max.tolist()
        list_digit =list_digit.tolist()
        def fullFactor(n, list_min, list_max, list_digit):
            assert n == len(list_min) == len(list_max) == len(list_digit), "数据维度不匹配"
            array_min = [float(i) for i in list_min]
            array_max = [float(i) for i in list_max]
            array_digit = [float(i) for i in list_digit]
            array_min = np.array(array_min)
            array_max = np.array(array_max)
            array_digit = np.array(array_digit)
            array_min = array_min.reshape((n, 1))
            array_max = array_max.reshape((n, 1))
            array_digit = array_digit.reshape((n, 1))
            array_u = np.hstack((array_min, array_max))
            array_u = np.hstack((array_u, array_digit))
            list_a = []
            output_list = []
            levels = []
            for i in range(n):
                a = pow(10, -array_u[i, 2])
                # 取出所有可能的值放入一个列表中。
                list_b = np.round(np.arange(array_u[i, 0], array_u[i, 1], a), int(array_u[i, 2])).tolist()
                list_a.append(list_b)
                levels.append(len(list_b))
            level_repeat = 1
            range_repeat = np.prod(levels)
            H = np.zeros((range_repeat, n))
            for i in range(n):
                range_repeat /= levels[i]  # range_report = range_report/levels[i]
                lvl = []
                for j in list_a[i]:
                    lvl += [j] * level_repeat  # lvl = lvl +[j] * level_repeat
                rng = lvl * int(range_repeat)
                level_repeat *= levels[i]  # level_repeat=level_repeat*levels[i]
                H[:, i] = rng
            return H
        def gen_data(n, d, temp):
            global a
            global S
            global E
            a = np.matrix(np.array(temp))
            S = [[(a[i].T * a[i]) for i in range(n)]]  # change the set
            S = S[0]
            E = np.eye(d, dtype=int)  # 单位矩阵
            E = np.matrix(np.array(E))

    # rank-one update for greedy if the number of samples is less than the dimension 如果样本数小于维度，则对贪婪进行秩一更新
        def srankone(X, Xs, indexN, n):
            nx = len(indexN)
            y = [0] * nx
            j = 0
            opti = 0.0
            Y = 0.0
            Ya = 0.0
            Yb = 0.0
            Yc = 0.0
            Ys = 0.0
            for i in indexN:
                y[j] = (a[i] * (E - Xs * X) * a[i].T).tolist()[0][0]
                j = j + 1
            opti = indexN[y.index(max(y))]
            Y = X + S[opti]
            Ya = Xs * a[opti].T
            Yb = (E - Xs * X) * a[opti].T
            Yc = 1 / (a[opti] * Yb)[0, 0]
            Ys = Xs - Yc * (Ya * Yb.T) - Yc * (Yb * Ya.T) + (Yc ** 2) * (1 + (a[opti] * Ya)[0, 0]) * (Yb * Yb.T)
            return Y, Ys, opti

        def upd_inv_minus(X, Xs, opti):
            Y = 0.0
            Y = X - S[opti]
            Ya = Xs * a[opti].T
            Ys = Xs + 1 / (1 - (a[opti] * Ya)[0, 0]) * (Ya * Ya.T)
            return Y, Ys

        # Update the inverse matrix by adding a rank-one matrix 通过添加一个秩矩阵来更新逆矩阵
        def upd_inv_add(X, Xs, opti):
            Y = 0.0
            Y = X + S[opti]
            Ya = Xs * a[opti].T
            Ys = Xs - 1 / (1 + (a[opti] * Ya)[0, 0]) * (Ya * Ya.T)
            return Y, Ys

        # 贪心算法
        def grd(n, k, d):
            c = 1
            x = [0] * n  # chosen set
            y = [1] * n  # unchosen set
            indexN = np.flatnonzero(y)
            gen_data(n, d, all_array)  # load data
            index = 0
            X = np.zeros([d, d])
            Xs = np.zeros([d, d])
            Y = np.zeros([d, d])
            Ys = np.zeros([d, d])
            while c < k + 1:
                if c <= d:
                    Y, Ys, index = srankone(X, Xs, indexN, n)
                    X = Y
                    Xs = Ys
                else:
                    Ys, index = nrankone(Xs, indexN, n)
                    Xs = Ys
                x[index] = 1
                y[index] = 0
                indexN = np.flatnonzero(y)
                c = c + 1
                [a, b] = np.linalg.eigh(Xs)
            grdx = x  # greedy solution
            grdf = f(x, d)  # greedu value
            return grdf, grdx, Xs.I, Xs

        # 局部搜索法
        def localsearch(n, k, d):
            grdval, bestx, X, Xs = grd(n, k, d)
            sel = [i for i in range(n) if bestx[i] == 1]  # chosen set
            t = [i for i in range(n) if bestx[i] == 0]  # unchosen set
            # print("sel=", sel)
            # print("The output value of Greedy algorithm = ", math.exp(grdval / d))
            # local search
            Y = 0.0
            Ys = 0.0
            fval = 0.0
            optimal = False
            bestf = grdval
            while (optimal == False):
                optimal = True
                for i in sel:
                    Y = 0.0
                    Ys = 0.0
                    tempX = X
                    tempXs = Xs
                    Y, Ys, index, fval = findopt(tempX, tempXs, i, t, n, bestf)
                    if fval > bestf:
                        # print("The current objective value of Local Sarch algorithm = ", math.exp(fval/d))
                        optimal = False
                        bestx[i] = 0
                        bestx[index] = 1  # update solution
                        bestf = fval  # update the objective value
                        X, Xs = upd_inv_add(Y, Ys, index)  # update the inverse
                        sel = np.flatnonzero(bestx)  # update chosen set
                        t = [i for i in range(n) if bestx[i] == 0]  # update the unchosen set
                        break
            return sel
        def nrankone(Xs, indexN, n):
            nx = len(indexN)
            y = [0] * nx
            j = 0
            opti = 0
            Ya = 0.0
            Ys = 0.0
            for i in indexN:
                y[j] = (a[i] * Xs * a[i].T).tolist()[0][0]
                j = j + 1
            opti = indexN[y.index(max(y))]
            Ya = Xs * a[opti].T
            Ys = Xs - 1 / (1 + (a[opti] * Ya)[0, 0]) * (Ya * Ya.T)
            return Ys, opti

        # primal objective function logdet(X) 原始目标函数 logdet(X)
        def f(x, d):
            val = 0.0
            indexN = np.flatnonzero(x)  # 返回非零元素下标
            for i in indexN:
                val = val + x[i] * S[i]
            val = np.linalg.slogdet(val)
            val = val[1]
            return val

        ## The rank one update for local search 本地搜索排名第一的更新
        def findopt(X, Xs, i, indexN, n, val):
            Y = 0.0
            Ys = 0.0
            Y, Ys = upd_inv_minus(X, Xs, i)
            temp = []
            for j in indexN:
                temp.append(1 + a[j] * Ys * a[j].T)
            tempi = np.argmax(temp)
            opti = indexN[tempi]
            val = val + math.log(1 - a[i] * Xs * a[i].T) + math.log(1 + a[opti] * Ys * a[opti].T)
            return Y, Ys, opti, val

        global all_array
        all_array = fullFactor(n, list_min, list_max, list_digit)
        assert all_array.shape[0] >= m, "试验次数要小于全析因试验数"
        sel = localsearch(all_array.shape[0], m, n)  # 局部搜索法
        output_list = []
        for i in range(len(sel)):
            output_list.append(all_array[sel[i], :].tolist())
        return output_list
    """
    return py"D_optimal"(n, list_min, list_max, list_digit, m)
end

function ccdesign(n, list_min, list_max, list_digit, center)
    list_min = Array(list_min)
    list_max = Array(list_max)
    list_digit = Array(list_digit)
    center = Array(center)
    #中央复合设计
    py"""
    import numpy as np
    import pandas as pd
    # 中央复合法
    def central_composite(n, list_min, list_max, list_digit, center, alpha=None, face=None):
        list_min = list_min.tolist()
        list_max = list_max.tolist()
        list_digit = list_digit.tolist()
        list_center = center.tolist()
        assert n == len(list_min) == len(list_max) == len(list_digit), "数据维度不匹配"
        array_min = [float(i) for i in list_min]
        array_max = [float(i) for i in list_max]
        array_digit = [float(i) for i in list_digit]
        array_min = np.array(array_min)
        array_max = np.array(array_max)
        array_digit = np.array(array_digit)
        array_min = array_min.reshape((n, 1))
        array_max = array_max.reshape((n, 1))
        array_digit = array_digit.reshape((n, 1))
        array_input = np.hstack((array_min, array_max))
        array_input = np.hstack((array_input, array_digit))
        def repeat_center(n, repeat):
            return np.zeros((repeat, n))
        def star(n, alpha='faced', center=(1, 1)):   
            # Star points at the center of each face of the factorial
            if alpha == 'faced':
                a = 1
            elif alpha == 'orthogonal':
                nc = 2 ** n  # factorial points
                nco = center[0]  # center points to factorial
                na = 2 * n  # axial points
                nao = center[1]  # center points to axial design
                # value of alpha in orthogonal design
                a = (n * (1 + nao / float(na)) / (1 + nco / float(nc))) ** 0.5
            elif alpha == 'rotatable':
                nc = 2 ** n  # number of factorial points
                a = nc ** (0.25)  # value of alpha in rotatable design
            else:
                raise ValueError('Invalid value for "alpha": {:}'.format(alpha))
            # Create the actual matrix now.
            H = np.zeros((2 * n, n))
            for i in range(n):
                H[2 * i:2 * i + 2, i] = [-1, 1]
            H *= a
            return H, a
        def union(H1, H2):
            H = np.r_[H1, H2]
            return H
        def fullfact(levels):
            n = len(levels)  # number of factors
            nb_lines = np.prod(levels)  # number of trial conditions
            H = np.zeros((nb_lines, n))

            level_repeat = 1
            range_repeat = np.prod(levels)
            for i in range(n):
                range_repeat /= levels[i]  # range_report = range_report/levels[i]
                lvl = []
                for j in range(levels[i]):
                    lvl += [j] * level_repeat  # lvl = lvl +[j] * level_repeat
                rng = lvl * int(range_repeat)
                level_repeat *= levels[i]  # level_repeat=level_repeat*levels[i]
                H[:, i] = rng
            return H
        def ff2n(n):
            return 2 * fullfact([2] * n) - 1
        def ccdesign(n, center=(4, 4), alpha='orthogonal', face='circumscribed'):
            # Check inputs
            assert isinstance(n, int) and n > 1, '"n" must be an integer greater than 1.'
            assert alpha.lower() in ('orthogonal', 'o', 'rotatable',
                                     'r'), 'Invalid value for "alpha": {:}'.format(alpha)
            assert face.lower() in ('circumscribed', 'ccc', 'inscribed', 'cci',
                                    'faced', 'ccf'), 'Invalid value for "face": {:}'.format(face)
            try:
                nc = len(center)
            except:
                raise TypeError('Invalid value for "center": {:}. Expected a 1-by-2 array.'.format(center))
            else:
                if nc != 2:
                    raise ValueError('Invalid number of values for "center" (expected 2, but got {:})'.format(nc))
            # Orthogonal Design
            if alpha.lower() in ('orthogonal', 'o'):
                H2, a = star(n, alpha='orthogonal', center=center)
            # Rotatable Design
            if alpha.lower() in ('rotatable', 'r'):
                H2, a = star(n, alpha='rotatable')
            # Inscribed CCD
            if face.lower() in ('inscribed', 'cci'):
                H1 = ff2n(n)
                H1 = H1 / a  # Scale down the factorial points
                H2, a = star(n)
            # Faced CCD
            if face.lower() in ('faced', 'ccf'):
                H2, a = star(n)  # Value of alpha is always 1 in Faced CCD
                H1 = ff2n(n)
            # Circumscribed CCD
            if face.lower() in ('circumscribed', 'ccc'):
                H1 = ff2n(n)
            C1 = repeat_center(n, center[0])
            C2 = repeat_center(n, center[1])
            H1 = union(H1, C1)
            H2 = union(H2, C2)
            H = union(H1, H2)
            return H
        if center is None:
            center = (4, 4)
        if alpha is None:
            alpha = 'o'
        if face is None:
            face = 'ccc'
        center = tuple(center)
        array_distribution = ccdesign(n, center=center, alpha=alpha, face=face)
        array_distribution = np.unique(array_distribution, axis=0)
        array_output = np.zeros(array_distribution.shape)
        for i in range(array_distribution.shape[0]):
            for j in range(array_distribution.shape[1]):
                if array_input[j, 2] > 0:
                    array_output[i, j] = (array_input[j, 0] + array_input[j, 1]) / 2 + array_distribution[i, j] * (
                            array_input[j, 1] - array_input[j, 0]) / 2
                    array_output[i, j] = round(array_output[i, j], int(array_input[j, 2]))
                else:
                    array_output[i, j] = int((array_input[j, 0] + array_input[j, 1]) / 2 + array_distribution[i, j] * (
                            array_input[j, 1] - array_input[j, 0]) / 2)
        return array_output.tolist(), array_distribution
    """
    return py"central_composite"(n, list_min, list_max, list_digit, center)
end
