#模拟退火算法（自主设计）
#自适应搜索邻域解

function simulatedannealing(func, x0::Vector, lb, ub; T0=1, alpha=0.99, L=200, max_iter=1000)
    nvar = length(x0)
    T = T0
    x = x0
    fcount = 0                 #函数评估次数
    x_history = []             #每一次迭代的历史
    fval_history = []
    fval = func(x)
    fcount = fcount + 1

    for iter in 1:max_iter
        #自适应步长
        step = 0.5 * (ub - lb) * (1 - (iter / max_iter))

        #每个温度下的搜索次数
        for l = 1:L
            #生成邻域点
            x_new = x + (2 * rand(nvar) .- 1) .* step
            for i = 1:nvar
                if x_new[i] < lb[i]
                    x_new[i] = lb[i]
                elseif x_new[i] > ub[i]
                    x_new[i] = ub[i]
                end
            end
            fval_new = func(x_new)
            fcount = fcount + 1

            Delta = fval_new - fval    #能量变化量

            if Delta < 0               #能量下降(最小化)
                fval = fval_new
                x = x_new
            else                       #能量上升,通过metropolis概率公式选择
                Prob = exp(-Delta / T)
                if rand() <= Prob
                    fval = fval_new
                    x = x_new
                end
            end
        end

        T = alpha * T                 #冷却
        push!(x_history, x)
        fval_history = [fval_history; fval]  #ok,Vector
    end
    min_fval = findmin(fval_history)
    x = x_history[min_fval[2]]
    fval = min_fval[1]

    return x, fval, fval_history  #x_historyx_history fcount, max_iter
end