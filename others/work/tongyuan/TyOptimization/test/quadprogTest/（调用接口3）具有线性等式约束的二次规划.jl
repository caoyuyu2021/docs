using Test
using TyOptimization

@testset "（调用接口3）具有线性等式约束的二次规划.jl" begin
    H = [1 -1; -1 2]
    f = [-2; -6]
    Aeq = [1 1]
    beq = [0]
    @test typeof(H) <: Union{Matrix,Vector,Nothing}
    @test typeof(f) <: Union{Matrix,Vector,Nothing}
    @test typeof(Aeq) <: Union{Matrix,Vector,Nothing}
    @test typeof(beq) <: Union{Matrix,Vector,Nothing}
    result = quadprog(H, f, [], [], Aeq, beq)
    @test typeof(result) <: OptimizeResult

    showres(result)
end