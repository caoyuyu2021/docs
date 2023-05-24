

mutable struct highs_options                #highs算法参数选项类
    algorithm::String                       #优化算法名称highs
    maxiter                                 #最大迭代次数 None
    disp                                    #若为True，则输出收敛信息 False
    presolve                                #识别无界性，简化问题 True
    time_limit                              #解决问题的最长时间  None
    dual_feasibility_tolerance              #双重可行性容差 None
    primal_feasibility_tolerance            #原始可行性容差 None
    ipm_optimality_tolerance                #最优性容差 None
    simplex_dual_edge_weight_strategy       #单纯形双边权策略 None                            
end

mutable struct highs_ipm_options      #highs-ipm算法参数选项类
    algorithm::String                 #优化算法名称
    maxiter                           #最大迭代次数 None
    disp                              #若为True，则输出收敛信息 false
    presolve                          #识别无界性，简化问题 true
    time_limit                        #解决问题的最长时间None
    dual_feasibility_tolerance        #双重可行性容差
    primal_feasibility_tolerance      #原始可行性容差
    ipm_optimality_tolerance          #最优性容差

end

mutable struct highs_ds_options         #highs-ds算法参数选项类
    algorithm::String                   #优化算法名称
    maxiter                             #最大迭代次数
    disp                                #若为True，则输出收敛信息
    presolve                            #识别无界性，简化问题
    time_limit                          #解决问题的最长时间
    dual_feasibility_tolerance          #双重可行性容差
    primal_feasibility_tolerance        #原始可行性容差
    simplex_dual_edge_weight_strategy   #单纯形双边权策略
end

highs_ds_options_default = highs_ds_options("highs-ds", None(), false, true, None(), None(), None(), None())

highs_ipm_options_default = highs_ipm_options("highs-ipm", None(), false, true, None(), None(), None(), None())

highs_options_default = highs_options("highs",  None(), false, true, None(), None(), None(), None(), None())

