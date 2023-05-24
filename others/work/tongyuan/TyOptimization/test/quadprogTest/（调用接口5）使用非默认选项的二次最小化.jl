using Test
using TyOptimization

@testset "（调用接口5）使用非默认选项的二次最小化.jl" begin
    H = [1 -1; -1 2]
    f0 = [-2; -6]
    A = [1 1; -1 2; 2 1]
    b = [2; 2; 3]
    Aeq = []
    beq = []
    lb = []
    ub = []
    @test typeof(H) <: Union{Matrix,Nothing}
    @test typeof(f0) <: Union{Vector,Nothing}
    @test typeof(Aeq) <: Union{Matrix,Vector,Nothing}
    @test typeof(beq) <: Union{Vector,Nothing}
    @test typeof(A) <: Union{Matrix,Vector,Nothing}
    @test typeof(b) <: Union{Vector,Nothing}
    @test typeof(lb) <: Union{Vector,Nothing}
    @test typeof(ub) <: Union{Vector,Nothing}
    options = optimoptions("quadprog")
    options.disp = true
    @test typeof(options.disp) <: Bool

    result = quadprog(H, f0, A, b, Aeq, beq, lb, ub, options)
    @test typeof(result) <: OptimizeResult

end