using Test
using TyOptimization

@testset "（调用接口4）具有线性约束和边界的二次最小化.jl" begin
    H = [1 -1 1; -1 2 -2; 1 -2 4]
    f = [2; -3; 1]
    A = []
    b = []
    Aeq = ones(1, 3)
    beq = [1 / 2]
    lb = zeros(3)  #Vector
    ub = ones(size(lb))
    @test typeof(H) <: Union{Matrix,Nothing}
    @test typeof(f) <: Union{Vector,Nothing}
    @test typeof(Aeq) <: Union{Matrix,Vector,Nothing}
    @test typeof(beq) <: Union{Vector,Nothing}
    @test typeof(A) <: Union{Matrix,Vector,Nothing}
    @test typeof(b) <: Union{Vector,Nothing}
    @test typeof(lb) <: Union{Vector,Nothing}
    @test typeof(ub) <: Union{Vector,Nothing}
    result = quadprog(H, f, A, b, Aeq, beq, lb, ub)
    @test typeof(result) <: OptimizeResult
end