#paretosearch的不同调用方式
function paretosearch(objcon, x0, lb, ub, options=paretosearch_options_default::paretosearch_options)
    #options.step_size=(ub-lb)/10,每个维度的区间不同(所以这种默认不具有普遍性)
    res = DMSforMOO(objcon, x0, lb, ub; max_archive=options.max_archive, max_iter=options.max_iter, step_size=options.step_size, lambda=options.lambda, beta1=options.beta1, beta2=options.beta2, step_tolerance=options.step_tolerance, cons_tolerance=options.cons_tolerance)
    #拆解res,保留关键信息
    nvars = length(x0)
    len_res = length(res)
    len_fobj = length(res[1].fobj)
    ParetoFront = zeros(len_fobj, len_res)
    ParetoSolution = zeros(nvars, len_res)
    for i = 1:len_res
        ParetoFront[:, i] = res[i].fobj
        ParetoSolution[:, i] = res[i].sol
    end
    return (ParetoSolution,ParetoFront) #ParetoFront,ParetoSolution
end

function paretosearch(problem=paretosearch_problem_default::paretosearch_problem)
    res = DMSforMOO(problem.objcon, problem.x0, problem.lb, problem.ub; max_archive=problem.options.max_archive, max_iter=problem.options.max_iter, step_size=problem.options.step_size, lambda=problem.options.lambda, beta1=problem.options.beta1, beta2=problem.options.beta2, step_tolerance=problem.options.step_tolerance, cons_tolerance=problem.options.cons_tolerance)
    #拆解res,保留关键信息
    nvars = length(problem.x0)
    len_res = length(res)
    len_fobj = length(res[1].fobj)
    ParetoFront = zeros(len_fobj, len_res)
    ParetoSolution = zeros(nvars, len_res)
    for i = 1:len_res
        ParetoFront[:, i] = res[i].fobj
        ParetoSolution[:, i] = res[i].sol
    end
    return  (ParetoSolution,ParetoFront) #ParetoFront,ParetoSolution
end

