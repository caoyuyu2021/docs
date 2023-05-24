function Solve(prob,SolverName)
    if SolverName=="fmincon"
        f=prob.objective
        x0=prob.x0
        args= prob.args
        constraints=prob.constraints
        println(prob.Description)
        res=fmincon(f, x0, args, constraints)
        return res
    elseif SolverName=="fminbnd"
        f=prob.objective
        x0=prob.x0
        println(prob.Description)
        res=fminbnd(f,x0[1],x0[2])
        return res
    elseif SolverName=="fzero"
        f=prob.equations
        x0=prob.x0
        println(prob.Description)
        res=fzero(f,x0)
        return res
    end

end