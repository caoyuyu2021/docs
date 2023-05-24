using MultistartOptimization, NLopt

# 1.x, fval, ret = multistart(func, lb, ub) / multistart(func, lb, ub, options)
function multistart(func, lb, ub, options=mul_options())
    # 定义最小化问题
    P = MinimizationProblem(func, lb, ub)        

    # 局部优化算法           
    local_method = NLoptLocalMethod(algorithm=options.localmethod, xtol_abs=options.xtol_abs, xtol_rel=options.xtol_rel, maxeval=options.maxeval, maxtime=options.maxtime)    
    
    # 起始点个数
    multistart_method = TikTak(options.n)                   

    res = multistart_minimization(multistart_method, local_method, P)

    # 输出信息
    x = res.location                    # 最优解                      
    fval = res.value                    # 最优值
    ret = res.ret                       # SUCCESS, STOPVAL_REACHED, FTOL_REACHED, XTOL_REACHED, MAXEVAL_REACHED, MAXTIME_REACHED

    return x, fval, ret
end