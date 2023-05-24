using Test
using TyOptimization

@testset "（调用接口3）具有线性约束的二次规划.jl" begin
    H = [1 -1; -1 2]
    f = [-2; -6]
    A = [1 1; -1 2; 2 1]
    b = [2; 2; 3]
    @test typeof(H) <: Union{Matrix,Vector,Nothing}
    @test typeof(f) <: Union{Matrix,Vector,Nothing}
    @test typeof(A) <: Union{Matrix,Vector,Nothing}
    @test typeof(b) <: Union{Matrix,Vector,Nothing}
    result = quadprog(H, f, A, b, [], [])
    @test typeof(result) <: OptimizeResult

    showres(result)
end