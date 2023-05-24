# 模式搜索算法的不同调用方式

function patternsearch(func, nvars, x0::Vector, lb::Vector, ub::Vector, options=ps_options_default::ps_options)
    ps(func, nvars, x0::Vector, lb::Vector, ub::Vector; sigma=options.sigma, alpha=options.alpha, epsilon=options.epsilon)
end

function patternsearch(problem=ps_problem_default::ps_problem)
    ps(problem.func, problem.nvars, problem.x0, problem.lb, problem.ub; sigma=problem.options.sigma, alpha=problem.options.alpha, epsilon=problem.options.epsilon)
end



