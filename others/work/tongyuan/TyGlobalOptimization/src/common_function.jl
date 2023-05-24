#公用函数

#1. 测试函数
function ps_example(x)
    out = Array{Float64}(undef, 1, size(x, 1))
    for i = 1:size(x, 1)
        if x[i, 1] < -5
            out[1, i] = (x[i, 1] + 5)^2 + abs(x[i, 2])
        elseif x[i, 1] < -3
            out[1, i] = -2 * sin(x[i, 1]) + abs(x[i, 2])
        elseif x[i, 1] < 0
            out[1, i] = 0.5 * x[i, 1] + 2 + abs(x[i, 2])
        else
            out[1, i] = 0.3 * sqrt(x[i, 1]) + 5 / 2 + abs(x[i, 2])
        end
    end
    return out
end

function dejong5fcn(xin::Vector)
    xin = xin'
    a = [-32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32
        -32 -32 -32 -32 -32 -16 -16 -16 -16 -16 0 0 0 0 0 16 16 16 16 16 32 32 32 32 32]
    p = xin
    for i = 1:length(xin)
        p[i] = min(p[i], 65.536)
    end
    for i = 1:length(xin)
        p[i] = max(p[i], -65.536)
    end
    k = 0.002
    for j = 1:25
        k = k + 1 / (j + (p[1] - a[1, j])^6 + (p[2] - a[2, j])^6)
    end
    score = 1 / k
    return score
end

#2. 其他函数
#判断主导关系
function dominate(fobj_x, fobj_y)
    #x是新加的
    #y是原来的
    is_nondominate::Bool = 0        #1,x是非主导解
    x_dominate_y::Bool = 0          #1,x主导y
    for i = 1:length(fobj_x)
        if fobj_x[i] < fobj_y[i]
            is_nondominate = 1
            break
        end
    end
    temp = 0
    for i = 1:length(fobj_x)
        if fobj_x[i] < fobj_y[i]
            temp = temp + 1
        end
    end
    if temp == length(fobj_x)
        x_dominate_y = 1
    end

    return is_nondominate, x_dominate_y
end

#可行性规则
function feasibility_rule(fobj, cons_ueq, lb, ub, x, cons_tolerance)#2种约束
    m = length(fobj)                      #目标数目
    n = length(cons_ueq)                  #约束数目

    if (sum(x .<= lb) != 0) || (sum(x .>= ub) != 0)
        fobj_new = Tuple(Inf * ones(m))
    else
        for i = 1:n
            if (cons_ueq[i] <= cons_tolerance)         #标准形式，cons_ueq<=0
                fobj_new = fobj
            else
                fobj_new = Tuple(Inf * ones(m))
            end
        end
    end
    return fobj
end

function options_set(slover_name::String)  #优化选项设置    
    if slover_name == "pso"
        op = pso_options_default
    elseif slover_name == "ga"
        op = ga_options_default
    elseif slover_name == "sa"
        op = sa_options_default
    elseif slover_name == "patternsearch"
        op = ps_options_default
    elseif slover_name == "gamultiobj"
        op = gamultiobj_options_default
    elseif slover_name == "paretosearch"
        op = paretosearch_options_default
    elseif slover_name == "surrogateopt"
        op = surr_options_default
    else
        error("目前仅支持ga, pso, sa, patternsearch, gamultiobj, paretosearch, surrogateopt")
    end
    return op
end

function problem_set(slover_name::String)  #优化问题设置
    if slover_name == "pso"
        op = pso_problem_default
    # elseif slover_name == "ga"           #删除ga(problem)调用方式
    #     op = ga_problem_default
    elseif slover_name == "sa"
        op = sa_problem_default
    elseif slover_name == "patternsearch"
        op = ps_problem_default
    elseif slover_name == "gamultiobj"
        op = gamultiobj_problem_default
    elseif slover_name == "paretosearch"
        op = paretosearch_problem_default
    elseif slover_name == "surrogateopt"
        op = surr_problem_default
    else
        error("目前仅支持ga, pso, sa, patternsearch, gamultiobj, paretosearch, surrogateopt")
    end
end


