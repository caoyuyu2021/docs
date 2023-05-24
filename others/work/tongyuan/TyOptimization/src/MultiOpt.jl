function fminimax(fun, x0::Vector,constraints::Vector,bounds::Vector)
    fun0(x) = maximum(fun(x))
    fmincon(fun0, x0, constraints,bounds)
end

function fminimax(fun, x0::Vector, constraints::Vector)
    fun0(x) = maximum(fun(x))
    fmincon(fun0, x0, constraints)
end