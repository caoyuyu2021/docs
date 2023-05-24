#单点版本
#基于DMS参考文献实现
using TyMath

mutable struct individual
    sol                 #解
    fobj                #目标函数值
    cons_ueq            #约束表达式值
end

function DMSforMOO(objcon, x0, lb, ub; max_archive, max_iter, step_size, lambda, beta1, beta2, step_tolerance, cons_tolerance)

    nvars = length(x0)
    (fobj, cons_ueq) = objcon(x0)                  
    start_point = individual(x0, fobj, cons_ueq)

    #initial List
    L = [start_point;]
    pattern = [eye(nvars) -eye(nvars)]                       #pattern，2nvars或者nvars+1           
    direct_points = zeros(nvars, 2 * nvars)                  #初始化2nvars或者nvars+1 方向搜索点
    
    iter = 0
    while iter < max_iter
        #更新点
        for i = 1:2*nvars
            direct_points[:, i] = x0 + pattern[:, i] .* step_size
        end
        #筛选点，Ladd
        Ladd = []
        for i = 1:2*nvars
            temp = direct_points[:, i]
            (fobj_temp, cons_ueq_temp) = objcon(temp)
            #考虑约束的fobj 
            fobj = feasibility_rule(fobj_temp, cons_ueq_temp, lb, ub, temp, cons_tolerance)
            if fobj != Inf
                temp_point = individual(temp, fobj_temp, cons_ueq_temp)
                if i == 1
                    Ladd = [temp_point;]
                else
                    Ladd = [Ladd; temp_point]
                end
            end
        end

        #过滤被主导点,L1=L;L2=Ladd;L3=Lfilter=[L1 L2]
        L1 = L
        L2 = Ladd
        L3 = [L1; L2]
        lenL1 = length(L1)
        lenL2 = length(L2)
        lenL3 = length(L3)
        index_del_L3 = []
        for i = 1:lenL2
            for j = 1:lenL3
                if j != i + lenL1
                    (is_nondominate, x_dominate_y) = dominate(L2[i].fobj, L3[j].fobj)
                    if is_nondominate            #x 是非主导点
                        if x_dominate_y          #x 主导 y  
                            if j ∉ index_del_L3
                                index_del_L3 = [index_del_L3; j]          #删除y索引  
                            end
                        end
                    else                         #x被y主导 
                        if (lenL1 + i) ∉ index_del_L3
                            index_del_L3 = [index_del_L3; lenL1 + i]      #删除x索引
                        end
                    end
                end
            end
        end

        index_del_L3 = ty_sort(index_del_L3)
        deleteat!(L3, index_del_L3)

        #删除相比于L1无分量提升的非主导解（可能存在问题，后续调试并添加）

        Lfilter = L3
        
        #存档
        L_temp=[]
        lenLfilter = length(Lfilter)
        if lenLfilter > max_archive
            rp = randperm(max_archive)
            for i = 1:max_archive
                push!(L_temp,Lfilter[rp[i]])
            end
            L=L_temp
        else
            L=Lfilter
        end

        #update L and stepsize
        if isempty(L == Lfilter)
            r = beta1 + (beta2 - beta1) * rand()
            step_size = r * step_size                          #iterate is unsucessful
        else
            step_size = lambda * step_size
        end
        # a skip condition
        if step_size < step_tolerance
            break
        end

        iter = iter + 1
    end
    return L
end