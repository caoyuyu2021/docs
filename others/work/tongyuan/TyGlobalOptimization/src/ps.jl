#= 
模式搜索算法(Pattern Search)是Hooks和Jeeves于1961年提出的一种直接搜索算法, 
具有原理简单, 便于计算机实现的特点. 
=#

function ps(func, nvars, x0::Vector, lb::Vector, ub::Vector; sigma=1, alpha=0.2, epsilon=1e-6)
    #初始化
    # func   #目标函数
    # nvar   #变量维度
    # sigma  #步长
    # alpha  #收缩因子
    # epsion #允许的最小步长
    # lb     #边界下限
    # ub     #边上限

    x = x0   #初始点   列向量

    fcount = 0
    nitr = 0

    fval = func(x)
    fcount = fcount + 1
    

    e = eye(nvars)      #单位向量

    while (true)

        xold = x  #局部作用域嵌套，仍是局部
        fvalold = fval
        #轴向移动
        for j = 1:nvars
            #正轴向探测
            temp = x + sigma * e[j, :]   #中间点
            #边界限制                     #封装函数           
            for i = 1:nvars
                if temp[i] < lb[i]       #列向量
                    temp[i] = lb[i]
                end
                if temp[i] > ub[i]
                    temp[i] = ub[i]
                end
            end
            tempfval = func(temp)
            fcount = fcount + 1
            if tempfval < fval
                x = temp                 #xnew  
                fval = tempfval
            else
                #负轴向探测
                temp = x - sigma * e[j, :]   #中间点
                #边界限制
                for i = 1:nvars
                    if temp[i] < lb[i]
                        temp[i] = lb[i]
                    end
                    if temp[i] > ub[i]
                        temp[i] = ub[i]
                    end
                end
                tempfval = func(temp)
                fcount = fcount + 1
                if tempfval < fval
                    x = temp             #xnew
                    fval = tempfval
                end
            end
        end

        #模式移动
        if fval < fvalold
            temp = 2 * x - xold             #xnew  
            #边界限制
            for i = 1:nvars
                if temp[i] < lb[i]       #列向量
                    temp[i] = lb[i]
                end
                if temp[i] > ub[i]
                    temp[i] = ub[i]
                end
            end
            tempfval = func(temp)
            fcount = fcount + 1
            if tempfval < fval
                x = temp                 #xnew  
                fval = tempfval
            end
        else
            sigma = alpha * sigma
        end
        nitr = nitr + 1
        #检查终止条件
        if sigma < epsilon
            break
        end

    end
    return x, fval, nitr, fcount
end


   









