#代理优化算法
using Surrogates 

function surrogateopt(obj, lb, ub)

    #参数
    num_samples = 10 #采样点数
    num_new_samples = 100 #新增采样点数
    sample_algorithm = SobolSample() #采样方法
    new_sample_algorithm = UniformSample() #新增点采样方法
    scale_factor = 0.5 #起始尺度
    sparse = false #使稀疏化

    maxiters = 100 #迭代次数
    rad = linearRadial() #径向基函数

    #采样
    x = sample(num_samples, lb, ub, sample_algorithm)
    y = obj.(x)#候选点
    #构建代理
    surr = RadialBasis(x, y, lb, ub; rad,
        scale_factor=scale_factor, sparse=sparse)
    #代理优化
    results = surrogate_optimize(obj, SRBF(), lb, ub, surr,
        new_sample_algorithm; maxiters=maxiters,
        num_new_samples=num_new_samples, needs_gradient=false)
    return results#解和函数值
end

function surrogateopt(obj, lb, ub, options)

    #参数
    num_samples = options.num_samples #采样点数
    num_new_samples = options.num_new_samples #新增采样点数
    sample_algorithm = options.sample_algorithm #采样方法
    new_sample_algorithm = options.new_sample_algorithm #新增点采样方法
    scale_factor = options.scale_factor #起始尺度
    sparse = options.sparse #使稀疏化
    maxiters = options.maxiters
    rad = options.rad #径向基函数

    #采样
    x = sample(num_samples, lb, ub, sample_algorithm)
    y = obj.(x)#候选点
    #构建代理
    surr = RadialBasis(x, y, lb, ub; rad,
        scale_factor=scale_factor, sparse=sparse)
    #代理优化
    results = surrogate_optimize(obj, SRBF(), lb, ub, surr,
        new_sample_algorithm; maxiters=maxiters,
        num_new_samples=num_new_samples, needs_gradient=false)
    return results#解和函数值

end

function surrogateopt(problem)

    #参数
    obj = problem.obj
    lb = problem.lb
    ub = problem.ub
    num_samples = problem.options.num_samples #采样点数
    num_new_samples = problem.options.num_new_samples #新增采样点数
    sample_algorithm = problem.options.sample_algorithm #采样方法
    new_sample_algorithm = problem.options.new_sample_algorithm #新增点采样方法
    scale_factor = problem.options.scale_factor #采样尺度
    sparse = problem.options.sparse #使稀疏化
    maxiters = problem.options.maxiters
    rad = problem.options.rad #径向基函数

    #采样
    x = sample(num_samples, lb, ub, sample_algorithm)
    y = obj.(x)#候选点
    #构建代理
    surr = RadialBasis(x, y, lb, ub; rad,
        scale_factor=scale_factor, sparse=sparse)
    #代理优化
    results = surrogate_optimize(obj, SRBF(), lb, ub, surr,
        new_sample_algorithm; maxiters=maxiters,
        num_new_samples=num_new_samples, needs_gradient=false)
    return results#解和函数值
end

